%% pl7kp_1n.m
% Побудова графіка бігучої хвилі по нескінченній струні
clear all, close all, clc
load pl7_1n                                % читаємо дані з *.mat файла
disp([Nx Nt]);
fp = fopen('pl7_1n.bin','rb');             % відкриття бінарного файлу
[x,n] = fread(fp,Nx,'double');             % читаємо сітку x
disp(n==Nx); x = x';
[T,n] = fread(fp,Nt,'double');             % читаємо сітку T
disp(n==Nt); T = T';
M = zeros(Nt,Nx);                          % Матриця для 3D-графіка
for i = 1:Nt
   [y,n] = fread(fp,Nx,'double');          % читаємо u(:,t)
   M(i,:) = y';
end
fclose(fp);                                % закриття бінарного файлу
y = T; [X,T] = meshgrid(x,y); clear y      % meshgrid-сітки для 3-D графіка
surfl(X,T,M), shading interp, colormap pink
xlabel('x'), ylabel('t'), zlabel('u(x,t)')