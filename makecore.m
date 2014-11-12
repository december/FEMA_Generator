function [y] = makecore(d, mx, mn, n, rate ,noise);
% y : the core tensor to be generated
% d : the number of dimension
% mx : the max value of diagonal elements
% mn : the min value of diagonal elements
% n : the edge length of the cube core
% rate : the rate of non-zero nondiagonal elements
% noise : the max possible value of nondiagonal elements
tic
switch d
    case 3
        y = noise * sptenrand([n n n], rate);
        for i = 1:n
            y(i, i, i) = mn + (n-i) * (mx-mn) / (n-1);
        end;
    case 4
        y = noise * sptenrand([n n n n], rate);
        for i = 1:n
            y(i, i, i, i) = mn + (n-i) * (mx-mn) / (n-1);
        end;
    case 5
        y = noise * sptenrand([n n n n n], rate);
        for i = 1:n
            y(i, i, i, i, i) = mn + (n-i) * (mx-mn) / (n-1);
        end;
    otherwise
        disp('The value of d is illegal.');
end;
toc
