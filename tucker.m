function [x, y, A1, A2, A3, name] = tucker(d, lg, lgc, mx, mn, t, dr, ndr, rate, noise, fileName, saveall)
% d   : the number of dimension
% lg  : length of the whole tensor
% lgc : length of the core tensor
% mx  : the max value of diagonal elements in core tensor
% mn  : the min value of diagonal elements in core tensor
% t   : the standard value of diagonal elements in projection matrix
% dr  : the random range of diagonal elements in projection matrix
% ndr : the random range of nondiagonal elements in projection matrix
% rate : the rate of non-zero nondiagonal elements in core tensor
% noise : the max possible value of nondiagonal elements in core tensor
% fileName : the file's name where the result saved
% saveall : whether save all the infomation
y = makecore(d, mx, mn, lgc, rate, noise)
A1 = makepm(lg, lgc, t, dr, ndr)
A2 = makepm(lg, lgc, t, dr, ndr)
A3 = makepm(lg, lgc, t, dr, ndr)
A = {A1, A2, A3};
TX = ttensor(y, A);
x = tensor(TX)
x_tenmat = tenmat(x, 1, 't');
x_matrix = double(x_tenmat);
dlmwrite(fileName, x_matrix);
if saveall
	dlmwrite(strcat(fileName, '_A1'), A1);
	dlmwrite(strcat(fileName, '_A2'), A2);
	dlmwrite(strcat(fileName, '_A3'), A3);
	y_tenmat = tenmat(y, 1, 't');
	y_matrix = double(y_tenmat);
	dlmwrite(strcat(fileName, '_core'), y_matrix);
end;
