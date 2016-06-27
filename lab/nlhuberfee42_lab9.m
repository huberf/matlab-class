% ENGR1120 Tennessee Tech
% Noah Huber-Feely 6/27/2016
% Lab 9 - Selection and Bubble Sort

% Intialize work space
clear variables;
clc;
close all;

randVals = randi(100, 1, 100);
fprintf('Raw: ');
fprintf('%f ', randVals);
fprintf('\n');

tic
% Bubble sort
toSort = randVals;
for h = 1:length(toSort)
    for i = 1:(length(toSort)-1)
        if toSort(i) > toSort(i+1)
            temp = toSort(i);
            toSort(i) = toSort(i+1);
            toSort(i+1) = temp;
        end
    end
end
bubbleSorted = toSort;
fprintf('Bubble sort: ');
fprintf('%f ', bubbleSorted);
fprintf('\n');
toc

tic
% Selection sort
toSort = randVals;
curr_min = toSort(1);
curr_idx = 1;
for i = 1:length(toSort)
    curr_min = toSort(i);
    curr_idx = i;
    for a = i:length(toSort)
        if toSort(a) < curr_min
            curr_min = toSort(a);
            curr_idx = a;
        end
    end
    temp = toSort(i);
    toSort(i) = toSort(curr_idx);
    toSort(curr_idx) = temp;
end
selectionSorted = toSort;
fprintf('Selection sort: ');
fprintf('%f ', selectionSorted);
fprintf('\n');
toc