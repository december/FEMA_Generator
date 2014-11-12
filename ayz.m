[x, y, A1, A2, A3] = tucker(3, 12, 3, 1000, 100, 10, 1, 0, 0.01, 3);

tic
%round
x_tenmat = tenmat(x, 1, 't');
x_round = round(double(x_tenmat));
new_tenmat = tenmat(x_round, x_tenmat.rdims, x_tenmat.cdims, x_tenmat.tsize);
x = tensor(new_tenmat);
T = tucker_als(x, [3 3 3]);
toc

%error for core
ny = T.core;
dy = (y - ny).^2;
my = double(tenmat(dy, 1));
dy_value = sum(sum(my).^2) / (3 * 3 * 3);

%error for PM1
nA1 = T.U{1}
dA1 = (A1 - nA1).^2;
dA1_value = sum(dA1(:)) / (3 * 12);

%error for PM2
nA2 = T.U{2}
dA2 = (A2 - nA2).^2;
dA2_value = sum(dA2(:)) / (3 * 12);

%error for PM3
nA3 = T.U{3}
dA3 = (A3 - nA3).^2;
dA3_value = sum(dA3(:)) / (3 * 12);
