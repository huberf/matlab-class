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
y0 = 6;
v0 = 100;
initAngle = 50;

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
    time = time + 0.1;
end

figure(1);
hold on;
plot(x_vals, y_vals, 'b');
xlabel('X (m)');
ylabel('Y (m)');
legend('Position');

figure(2);
hold on;
plot(times, y_vals, 'r');
plot(times, acceleration, 'b');
plot(times, velocity, 'g');
title('Position, Velocity & Acceleration (Y-axis)');
xlabel('Time (seconds)');
ylabel('Y');
legend('Position', 'Acceleration', 'Velocity');
