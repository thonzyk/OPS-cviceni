%% PRVNÍ CVIÈENÍ KKY/OPS

rastr = 100;

% Koøeny polynomiální rovnice
koreny = roots([1 0 -29 0 100]);

x = -7:(1/rastr):7;
y = x.^4 -29*x.^2 + 100;

plot(x, y)

title('\textit{Ha\v{c}ek:} $\mathbf{x^4 -29x^2 + 100}$', 'interpreter', 'latex')


% Vyšší vlastní èísla Jacobiho matice pøísluší smìru vìtšího spádu.

%%
clear; clc;
x = -5:0.2:5;

[x1, x2] = meshgrid(x);
F = -153/178*(x1-2).^2 + 40/89*(x1-2).*(x2-1) - 57/89*(x2-1).^2;

figure
surf(x1, x2, F);
figure
contour(x1, x2, F)

% surf bez kontur
% figure
% mesh(x1, x2, F)

hold on 
Q = 1/89*[-153 40; 40 -114]; % Hessova matice
[V, D] = eig(Q); % Vlastní vektory
quiver([2 2], [1 1], V(1, :), V(2, :))
axis equal










