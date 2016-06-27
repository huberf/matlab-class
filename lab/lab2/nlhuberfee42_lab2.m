% ENGR1120 021 Tennessee Tech
% Noah Huber-Feely 6/07/2016
% Lab 2 - Ideal Gas Law

A = 100; % area (cm^2)
P = 300; % pressure
T = 325; % temperature (K)
M = 28.97; % molecular mass of air (g/mol)
R = 8.314; % ideal gas constant

% function for calculating required force
function forceNeeded(length)
% declare ALL variables
V=0;
n=0;
m=0;
force=0;

% Calculate force
force = P * A;

% Calculate Volume
V = A * length;

% Calculate number of moles
n = (P * V) / (R * T);

% Calculate mass of gas
m = n * M;

% Print descriptive stuff
fprintf("Pressure needed: " + force);
fprintf("Volume: " + V);
fprintf("Number of moles: " + n);
fprintf("Mass of gas: " + m);
end

x = 15;

forceNeeded(x);
