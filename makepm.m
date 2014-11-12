function [A] = makepm(l, s, t, dr, ndr);
% A : the projection matrix to be generated
% l : the length of long edge
% s : the length of short edge
% t : the standard value of diagonal elements
% dr : the random range of diagonal elements
% ndr : the random range of nondiagonal elements
tic
A = ndr * rand(l, s);
avg = round(l / s);
tmp = 1;
for i = 1:l
    if tmp == s
        avg = l - (s-1) * avg;
    end;
    A(i, tmp) = t + (2 * rand(1) - 1) * dr;
    if tmp < s && i > tmp * avg
        tmp = tmp + 1;
    end;
end;
% normalization
for i = 1:s
	A(:, i) = A(:, i) / norm(A(:, i));
end;
toc
