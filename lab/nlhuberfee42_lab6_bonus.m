% ENGR1120 Tennessee Tech
% Noah Huber-Feely 6/14/2016
% Lab 5 - Geometric Relations

% Initialize workspace
clear variables
clc
close all

x_vals = [];
y_vals = [];

acceleration = [];
velocity = [];
times = [];

x0 = 0;
y0 = 0;
v0 = input('Enter muzzle velocity: ');
initAngle = input('Enter initial angle: ');



time = 0;
inAir = 1;

g = 9.8;

index = 1;
while inAir
    x_vals(index) = x0 + v0*cosd(initAngle)*time;
    y_vals(index) = y0 + v0*sind(initAngle)*time - 0.5*g*time^2;
    acceleration(index) = g;
    velocity(index) = v0*sind(initAngle)-g*time;
    
    times(index) = time;
    if y_vals(index) < 0
        inAir = 0;
    end
    index = index + 1;
    time = time + 0.01;
end

star = [10, 1, 0, 0.1;
        30, 4, 0, 0.05;
        50, 7, 0, 0.2];
index = 1;
maxCoor = 0;
if max(x_vals) > max(y_vals)
    maxCoor = max(x_vals);
else
    maxCoor = max(y_vals);
end
for a = y_vals
    clf;
    hold on;
    axis([0, maxCoor, 0, maxCoor]);
    plot(x_vals(index), a, 'ro', 'MarkerSize', 10);
    arraySize = size(star);
    for i = 1:arraySize(1)
        if star(i, 3)
            plot(star(i, 1), star(i, 2), 'gp', 'MarkerSize', 20);
            plot(star(i, 1), star(i, 2), 'rp', 'MarkerSize', 30);
            plot(star(i, 1), star(i, 2), 'rp', 'MarkerSize', 40);
        else
            plot(star(i, 1), star(i, 2), 'gp', 'MarkerSize', 20);
        end
        if a > star(i, 2) - 1 && a < star(i, 2) + 1
            fprintf('In y range\n');
            if x_vals(index) > (star(i, 1) - 1) && x_vals(index) < (star(i, 1) + 1)
                fprintf('You hit the star!\n');
                star(i, 3) = 1;
            end
        end
        star(i, 2) = star(i, 2) + star(i, 4);
    end
    pause(0.001);
    index = index+1;
end
close all