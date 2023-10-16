%%pl7_2.m
% Побудова 3-D графіка
clear all, close all, clc

[X Y] = meshgrid(linspace(-1,1,251));
XY = X.^2+Y.^2;                  % обчислення допоміжної функції
C = XY<=1;                       % логічний масив
XYZ = zeros(size(XY));           % нульова матриця
XYZ(C) = 1 - XY(C);              % логічне індексування
Z = sqrt(XYZ);                   % обчислення функції z(x,y)
mesh(X,Y,Z), pause, close all
surfl(X,Y,Z), shading interp, colormap pink