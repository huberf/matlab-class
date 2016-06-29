% ENGR1120 Tennessee Tech
% Noah Huber-Feely 6/29/2016
% Lab 10 - User-defined functions

% Initialize work space
clear variables
close all
clc

firstTime = 1;
continueOn = 1;

% Loop around
% toCompare = [1, 2, 3, 4, 5, 6];
while continueOn
    if firstTime
        firstTime = 0;
        fprintf('Enter the values for the array (e.g. [1, 2, 3, 4, 5])\n');
    else
        fprintf('Enter the values for the array (e.g. [1, 2, 3, 4, 5] or 0 to quit.\n');
    end
    toCompare = input('');
    if sum((toCompare == 0)) > 0 && (length(toCompare) == 1)
        fprintf('Goodbye!\n')
        continueOn = 0;
    else
        meanOf = ttu_mean(toCompare);
        fprintf('The average is %f.\n', meanOf);

        minOf = ttu_min(toCompare);
        fprintf('Minimum of array is %f.\n', minOf);

        swapped = ttu_swap(toCompare, 2, 3);
        fprintf('The swapped array contains: ');
        fprintf('%f ', swapped);
        fprintf('\n');
    end
end