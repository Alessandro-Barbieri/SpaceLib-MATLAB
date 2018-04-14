
% Sample program: e_wtol_r.m

W = [0 0 0 0; 0 0 -2 0; 0 2 0 0; 0 0 0 0];
L = wtol(W);
printm('The L matrix is :',L)