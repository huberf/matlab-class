% ENGR1120 021 Tennessee Tech
% Noah Huber-Feely and Alan Jenskey 6/08/2016
% Lab 3 - Scalars, 1-D Matrices, and Plotting

close all
clear variables
clc

% Declare ALL variables to change
xCoor = [0, 0, 0, 0];
yCoor = [0, 0, 0, 0];

% Accept user input
fprintf('Input four x values sequentially: \n');
xCoor(1) = input('X: ');
xCoor(2) = input('X: ');
xCoor(3) = input('X: ');
xCoor(4) = input('X: ');

fprintf('Input four y values sequentially: \n');
yCoor(1) = input('Y: ');
yCoor(2) = input('Y: ');
yCoor(3) = input('Y: ');
yCoor(4) = input('Y: ');

% Make quadrilateral connect to starting point
xCoor(5) = xCoor(1);
yCoor(5) = yCoor(1);

% Plot all points and markers
hold on;
figure(1);
plot(xCoor, yCoor);
plot(xCoor(1), yCoor(1), 'hexagram', 'MarkerSize', 10);
plot(xCoor(2), yCoor(2), 'pentagram', 'MarkerSize', 10);
plot(xCoor(3), yCoor(3), 'diamond', 'MarkerSize', 10);
plot(xCoor(4), yCoor(4), '^', 'MarkerSize', 10);
plot(xCoor(5), yCoor(5), 'hexagram', 'MarkerSize', 10);

% Find the minimum and maximum coordinate
maxCoor = [0, 0];
minCoor = [0, 0];
for n = xCoor
    if n >= maxCoor(1)
        maxCoor(1) = n;
    end
    if n <= minCoor(1)
        minCoor(1) = n;
    end
end
for n = yCoor
    if n >= maxCoor(2)
        maxCoor(2) = n;
    end
    if n <= minCoor(2)
        minCoor(2) = n;
    end
end
axis([minCoor(1) - 1, maxCoor(1) + 1, minCoor(2) - 1, maxCoor(2) + 1])
title('Lab 3');
xlabel('X');
ylabel('Y');

% Calculate perimeter
sides = [0, 0, 0, 0];
sides(1) = sqrt((xCoor(2) - xCoor(1))^2 + (yCoor(2) - yCoor(1))^2);
sides(2) = sqrt((xCoor(3) - xCoor(2))^2 + (yCoor(3) - yCoor(2))^2);
sides(3) = sqrt((xCoor(4) - xCoor(3))^2 + (yCoor(4) - yCoor(3))^2);
sides(4) = sqrt((xCoor(1) - xCoor(4))^2 + (yCoor(1) - yCoor(4))^2);
perimeter = sum(sides);
fprintf('Side lengths: [%f, %f, %f, %f]\n', sides(1), sides(2), sides(3), sides(4));
fprintf('Perimeter: %f\n', perimeter);

% Calculate area
% Will use Heron's formula and divide quadrilaterial into two triangles
% A = sqrt(s(s-a)(s-b)(s-c))
% DEPRECATED
area = 0;
isConcave = 0;
triangleAreas = [0, 0];
hypotenuse = sqrt((xCoor(3) - xCoor(1))^2 + (yCoor(3) - yCoor(1))^2);

halfCircumference = (sides(1) + sides(2) + hypotenuse) / 2;
s = halfCircumference;
area = sqrt(s*(s-sides(1))*(s-sides(2))*(s-hypotenuse));

halfCircumference = (sides(3) + sides(4) + hypotenuse) / 2;
s = halfCircumference;
area = area + sqrt(s*(s-sides(3))*(s-sides(4))*(s-hypotenuse));

fprintf('The area is: %f\n', area);

% Display area to user
fprintf('The area is: %f\n', area);