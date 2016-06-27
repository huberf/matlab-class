% ENGR1120 Tennessee Tech
% Noah Huber-Feely and Alan Jenskey 6/13/2016
% Lab 4 - Systems of Equations and Matrices

% Initialize workspace
clear variables
clc
close all

A = [6 , 0 , -1 , 0 , 0
    -3 , 3 , 0 , 0 , 0
    0 , -1 , 9 , 0 , 0
    0 , -1 , -8 , 11 , -2
    -3 , -1 , 0 , 0, 4];

% Array of knowns
knowns = [50
    0
    160
    0
    0];
    

% Calculate the inverse of A
invA = inv(A);

% Display the inverse matrix
invA

% Calculate unkowns using *
unknowns = invA * knowns;

% Calculate unknowns using \
unknowns = A \ knowns;

% Display the known values
for i = knowns
    fprintf('Known %f mg/min\n', i);
end

% Add a space between knowns and unknowns
fprintf('\n');
  
% Display the previously unkown values
fprintf('C1: %f mg/m^3\n', unknowns(1));
fprintf('C2: %f mg/m^3\n', unknowns(2));
fprintf('C3: %f mg/m^3\n', unknowns(3));
fprintf('C4: %f mg/m^3\n', unknowns(4));
fprintf('C5: %f mg/m^3\n', unknowns(5));
