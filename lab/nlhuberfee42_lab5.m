% ENGR1120 Tennessee Tech
% Noah Huber-Feely 6/14/2016
% Lab 5 - Geometric Relations

% Initialize workspace
clear variables
clc
close all

% The array of points
sides = [0, 0; 2, 0; 1, sqrt(3)];

fprintf('The polygon has %f sides\n', length(sides));

% Setup side length variables
lengths = [];

if length(sides) == 3 || length(sides) == 4
    for i = linspace(1, length(sides), length(sides))
        if i < length(sides)
            lengths(i) = sqrt( (sides(i+1, 1) - sides(i, 1))^2 + (sides(i+1, 2) - sides(i, 2))^2 );
        else
            lengths(3) = sqrt( (sides(1, 1) - sides(i, 1))^2 + (sides(1, 2) - sides(i, 2))^2 );
        end
    end
end

angles = [];

if length(sides) == 3 || length(sides) == 4
    for i = linspace(1, length(sides), length(sides))
        if i == 1
            % Setup the various points for specific calculation
            x2 = sides(length(sides),1);
            x3 = sides(2, 1);
            x1 = sides(1, 1);
            y2 = sides(length(sides), 2);
            y3 = sides(2, 2);
            y1 = sides(1, 2);
            % Using three points, find angle in the middle
            angles(1) = atan2(abs((x2-x1)*(y3-y1)-(x3-x1)*(y2-y1)), ...
                (x2-x1)*(x3-x1)+(y2-y1)*(y3-y1));
            angles(1) = angles(1) / 3.141592654 * 180;
        elseif i < length(sides)
            % Setup the various points for specific calculation
            x2 = sides(i-1,1);
            x3 = sides(i+1, 1);
            x1 = sides(i, 1);
            y2 = sides(i-1, 2);
            y3 = sides(i+1, 2);
            y1 = sides(i, 2);
            % Using three points, find angle in the middle
            angles(i) = atan2(abs((x2-x1)*(y3-y1)-(x3-x1)*(y2-y1)), ...
                (x2-x1)*(x3-x1)+(y2-y1)*(y3-y1));
            angles(i) = angles(i) / 3.141592654 * 180;
        else
            % Setup the various points for specific calculation
            x2 = sides(i-1,1);
            x3 = sides(1, 1);
            x1 = sides(i, 1);
            y2 = sides(i-1, 2);
            y3 = sides(1, 2);
            y1 = sides(i, 2);
            % Using three points, find angle in the middle
            angles(i) = atan2(abs((x2-x1)*(y3-y1)-(x3-x1)*(y2-y1)), ...
                (x2-x1)*(x3-x1)+(y2-y1)*(y3-y1));
            angles(i) = angles(i) / 3.141592654 * 180;
        end
    end
end


if length(sides) == 3
    % Test if triangle is equilateral
    if range(round(lengths, 5)) == 0
        fprintf('The triangle is equilateral.\n')
    end
    % Test if triangle is isoceles
    angles = round(angles, 5);
    if (angles(1) == angles(2) && angles(3) ~= angles(1)) || ...
        (angles(2) == angles(3) && angles(1) ~= angles(2)) || ...
        (angles(3) == angles(1) && angles(2) ~= angles(3))
        fprintf('The triangle is isoceles.\n');
    end
    % Test if triangle is right
    if angles(1) < 90.00001 && angles(1) > 89.99999 || ...
            angles(2) < 90.00001 && angles(2) > 89.99999 || ...
            angles(3) < 90.00001 && angles(3) > 89.99999
        fprintf('Triangle is right\n');
    end
end

if length(sides) == 4
    % Test if quadrilateral is square
    isSquare = 1;
    for i = linspace(1, length(lengths), length(lengths))
        if i ~= length(sides)
            if lengths(i) ~= lengths(i+1)
                isSquare = 0;
            end
        end
    end
    if isSquare == 1 && range(angles) == 0
        fprintf('The quadrilateral is a square.\n');
    end
    % Test if quadrilateral is rectangle
    isRectangle = 0;
    if lengths(1) == lengths(3) && lengths(2) == lengths(4)
        isRectangle = 1;
    end
    if isRectangle == 1 && range(angles) == 0
        fprintf('The quadrilateral is a rectangle.\n');
    end
    % Test if quadrilaterial is a parralelagram
    if lengths(1) == lengths(3) && lengths(2) == lengths(4)
        fprintf('The quadrilateral is a parralellogram.\n');
    end
end