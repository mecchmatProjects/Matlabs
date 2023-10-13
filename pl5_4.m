%%pl5_4.m
% Знаходження кореня нелінійного рівняння f(x)=0.
clear all, close all, clc
f = @(x)(x.*x-2.*x.*sin(x)-1);
F = @(x)(f(x).^2);
ezplot(F,[-3,3]); hold on; ezplot(f,[-3,3]); grid on
D = input('Інтервал, де знаходиться корінь=');
z = input('Наближення=');
x = fminbnd(F,D(1),D(2));
disp(strcat('Мінімізація :',num2str(x)));
x = fzero(f,z);
disp(strcat('Корінь рівняння f(x)=0 :',num2str(x)));