function [X] = read_tensor(filename);
X_matrix = dlmread(filename);
X_tenmat = tenmat(X_matrix);
X = tensor(X_tenmat, 1, 't');