close all;
clear
clc

% Add Lib to Path
addpath 'lib'

syms th1 th2 x y x1 y1 x2 y2 real

A = [-sin(th1) cos(th1); -sin(th2) cos(th2)];
B = [-x1*sin(th1) + y1*cos(th1); -x2*sin(th2) + y2*cos(th2)];

P = inv(A) * B;

pretty(P)
simplify(P)
