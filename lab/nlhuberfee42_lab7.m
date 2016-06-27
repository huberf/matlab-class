% ENGR1120 Tennessee Tech
% Noah Huber-Feely 6/21/2016
% Lab 7 - Geometric Relations


% Initialize workspace
clear variables
clc
close all

fileId = fopen('lab7_input.txt', 'r');
if ~(fileId < 0)
    enrollment = [];
    inState = [];
    outOfState = [];
    index = 1;
    while index < 37
        enrollment(index) = fscanf(fileId, '%f', 1);
        inState(index) = fscanf(fileId, '%f', 1);
        outOfState(index) = fscanf(fileId, '%f', 1);
        index = index + 1;
    end

    enrMax = max(enrollment);
    enrMin = min(enrollment);
    enrAvg = mean(enrollment);
    inMax = max(inState);
    inMin = min(inState);
    inAvg = mean(inState);
    outMax = max(outOfState);
    outMin = min(outOfState);
    outAvg = mean(outOfState);
    % Showing min, max, and avg
    fprintf('Maximum enrollment is %f\n', max(enrollment));
    fprintf('Minimum enrollment is %f\n', min(enrollment));
    fprintf('Average enrollment is %f\n', mean(enrollment));
    fprintf('\n');
    fprintf('Maximum in-state tuition is %f\n', max(inState));
    fprintf('Minimum in-state tuition is %f\n', min(inState));
    fprintf('Average in-state tuition is %f\n', mean(inState));
    fprintf('\n');
    fprintf('Maximum out-of-state tuition is %f\n', max(outOfState));
    fprintf('Minimum out-of-state tuition is %f\n', min(outOfState));
    fprintf('Average out-of-state tuition is %f\n', mean(outOfState));
    fclose(fileId);

    figure(1);
    hold on;
    alpha(0.3);
    histogram(enrollment);
    alpha(0.3);
    histogram(inState);
    alpha(0.3);
    histogram(outOfState);

    figure(2);
    subplot(3, 1, 1);
    hold on;
    histogram(enrollment, 'BinWidth', 10000);
    plot(enrAvg, 19, 'bo', 'MarkerSize', 10, 'MarkerFaceColor', [0, 0, 1]);
    plot(enrMin, 19, 'go', 'MarkerSize', 10, 'MarkerFaceColor', [0, 1, 0]);
    plot(enrMax, 19, 'ro', 'MarkerSize', 10, 'MarkerFaceColor', [1, 0, 0]);
    title('Enrollment');
    subplot(3, 1, 2);
    hold on;
    histogram(inState, 'BinWidth', 5000);
    plot(inAvg, 14, 'bo', 'MarkerSize', 10, 'MarkerFaceColor', [0, 0, 1]);
    plot(inMin, 14, 'go', 'MarkerSize', 10, 'MarkerFaceColor', [0, 1, 0]);
    plot(inMax, 14, 'ro', 'MarkerSize', 10, 'MarkerFaceColor', [1, 0, 0]);
    title('In-State Tuition');
    subplot(3, 1, 3);
    hold on;
    histogram(outOfState, 'BinWidth', 5000);
    plot(outAvg, 19, 'bo', 'MarkerSize', 10, 'MarkerFaceColor', [0, 0, 1]);
    plot(outMin, 19, 'go', 'MarkerSize', 10, 'MarkerFaceColor', [0, 1, 0]);
    plot(outMax, 19, 'ro', 'MarkerSize', 10, 'MarkerFaceColor', [1, 0, 0]);
    title('Out-Of-State Tuition');
else
    fprintf('File failed to open.');
end