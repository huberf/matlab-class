% ENGR1120 Tennessee Tech
% Noah Huber-Feely and Alan Jenskey 6/14/2016
% Lab 5 - Systems of Equations and Matrices

% Initialize workspace
clear variables
clc
close all

sides = [0, 0; 1, 0; 0, 1; 1, 1];

if length(sides) > 4:
    fprintf('The polygon has %f sides', length(sides)/2);