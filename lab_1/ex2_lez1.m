clear all;
clc;

v = linspace(0, 1, 5);
w = rand([1 5]);
u = rand([1 5]);

p = u*v';
z = w *p;

A=[0,2,-1,2,0;1,1,1,0,0];

display(A*z')