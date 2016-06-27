% ENGR1120 Tennessee Tech
% Noah Huber-Feely 6/24/2016
% Lab 8 - Programming Algorithms

% Initialize working space
clear variables
close all
clc

randVals = rand(1, 10) * 10;

summation = 0;
for i = randVals
    summation = summation + i;
end

max_index = 1;
idx = 1;
max_val = randVals(1);
for i = randVals
    if i > max_val
        max_val = i;
        max_index = idx;
    end
    idx = idx + 1;
end

min_val = randVals(1);
for i = randVals
    if i < min_val
        min_val = i;
    end
end

%% Sorting section

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
toc

tic
% Insertion sort
toSort = randVals;
for i = (2:length(toSort))
    value = toSort(i);
    j = i - 1;
    while (j >= 1) && (toSort(j) > value)
        toSort(j+1) = toSort(j);
        j = j-1;
    end
    toSort(j+1) = value;
end
insertionSorted = toSort;
toc

tic
% Merge sort
mergeSorted = mergeSort(toSort);
toc

tic
% Quick sort
quickSorted = quickSort(toSort);
toc