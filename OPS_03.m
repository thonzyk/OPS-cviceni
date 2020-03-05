%% T�ET� CVI�EN� KKY/OPS
close all
clear
clc
% Odhad polohy r�diov�ho p�ij�ma�e

% Polohy maj�k�
M = [2 0 3;
     1 2 4];
 
% Skute�n� poloha p�ij�ma�e
x_true = [4 2]';

% variance gaussovsk� chyby m��en� 
sigma = 0.23;

x_0 = [0 0]';

d = sqrt(sum(bsxfun(@minus, x_true, M).^2, 1))';

y = d + sqrt(sigma)*randn(3, 1);

J_h = @(x) crit(x, y, M);

[xest, jest] = fminunc(J_h, x_true);


x_1 = -2:0.1:7;
x_2 = -1:0.1:6;

J = zeros(length(x_2), length(x_1));

for i=1:length(x_1)
   for j=1:length(x_2)
        J(j, i) = J_h([x_1(i); x_2(j)]);
   end
end

figure
[xx1, xx2] = meshgrid(x_1, x_2);
surf(x_1, x_2, J)

figure
contour(xx1, xx2, J)

hold on
grid on
plot(M(1, :), M(2, :), 'x') % polohy maj�k�
plot(x_true(1), x_true(2), 'o') % skute�n� poloha
plot(xest(1), xest(2), '*') % odhad polohy



% doplnit... 




%% Functions

function [J, grad_J] = crit(x, y, M)
    tmp = bsxfun(@minus, x, M);
    d = sqrt(sum(tmp.^2, 1))';
    e = y - d;
    J = e'*e;
    tmpunit = bsxfun(@rdivide, tmp, d');
    grad_J = -2 * sum(bsxfun(@times, tmpunit, e'), 2);
end


















