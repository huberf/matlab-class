% ENGR1120 Tennessee Tech
% Noah Huber-Feely 6/21/2016
% HW 2 - 

%% Initialize workspace
clear variables
clc
close all

%% Declar variables
dates = {};
high = [];
low = [];
rain = [];
snow = [];
months = [];

%% Begin file reading
fileId = fopen('weather2014.txt', 'r');
if ~(fileId < 0)
    stillThere  = 1;
    index = 1;
    monthIndex = 1;
    %% Extract data
    while (~feof(fileId))
        %dates{index} = fscanf(fileId, '%s', 1);
        date = fscanf(fileId, '%s', 1);
        if(length(date) ~= 0)
            dateNames((index-1)*8+1:((index-1)*8+1)+8) = date;
            switch date(4:6)
                case 'Jan'
                    months(index) = 1;
                case 'Feb'
                    months(index) = 2;
                case 'Mar'
                    months(index) = 3;
                case 'Apr'
                    months(index) = 4;
                case 'May'
                    months(index) = 5;
                case 'Jun'
                    months(index) = 6;
                case 'Jul'
                    months(index) = 7;
                case 'Aug'
                    months(index) = 8;
                case 'Sep'
                    months(index) = 9;
                case 'Oct'
                    months(index) = 10;
                case 'Nov'
                    months(index) = 11;
                case 'Dec'
                    months(index) = 12;
                otherwise
                    fprintf('Reading dates failed!\n');
            end
            high(index) = fscanf(fileId, '%f', 1);
            low(index) = fscanf(fileId, '%f', 1);
            rain(index) = fscanf(fileId, '%f', 1);
            snow(index) = fscanf(fileId, '%f' , 1);
            index = index + 1;
        end
    end
   
    %% Graph the temps
    figure(1);
    subplot(3, 1, 1);
    hold on;
    %% Determine high stuff
    sizeOfHigh = size(high);
    plot(1:sizeOfHigh(2), high, 'r');
    p = polyfit(1:sizeOfHigh(2), high, 4);
    highFit = polyval(p, 1:sizeOfHigh(2));
    plot(1:sizeOfHigh(2), highFit, 'r');
    
    % Use my own line of best fit function
    highFit = lineFit(1:sizeOfHigh(2), high);
    toTest = polyfit(1:sizeOfHigh(2), high, 1);
    fprintf('Custom line fit function returned a slope of %f and a y-intercept of %f for the highs.\n', highFit(1), highFit(2));
    fprintf('The built in fit function returned a slope of %f and a y-intercept of %f for the highs.\n', toTest(1), toTest(2));
    %% Determine low stuff
    sizeOfLow = size(low);
    plot(1:sizeOfLow(2), low, 'b');
    p = polyfit(1:sizeOfLow(2), low, 4);
    lowFit = polyval(p, 1:sizeOfLow(2));
    plot(1:sizeOfLow(2), lowFit, 'b');
    xlabel('Day');
    ylabel('Temperature');
    title('Highs/Lows');
    
    % Use my own line of best fit function
    lowFit = lineFit(1:sizeOfLow(2), low);
    toTest = polyfit(1:sizeOfHigh(2), low, 1);
    fprintf('Custom line fit function returned a slope of %f and a y-intercept of %f for the lows.\n', lowFit(1), lowFit(2));
    fprintf('The built in fit function returned a slope of %f and a y-intercept of %f for the lows.\n', toTest(1), toTest(2));
    %% Graph the rain and snow
    totalRain = [0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0];
    totalSnow = [0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0];
    sizeOfRain = size(rain);
    for i = 1:sizeOfRain(2)
        indexOf = months(i);
        totalRain(indexOf) = totalRain(indexOf) + rain(i);
        totalSnow(indexOf) = totalSnow(indexOf) + snow(i);
    end
    subplot(3, 1, 2);
    bar(1:12, totalRain);
    ylabel('Inches');
    xlabel('Month');
    title('Rainfall');
    subplot(3, 1, 3);
    bar(1:12, totalSnow);
    ylabel('Inches');
    xlabel('Month');
    title('Snowfall');
    
    %% Produce summary file
    filename = sprintf('summary_20%s.txt', '14');
    toWrite = fopen(filename, 'w');
    fprintf(toWrite, 'Weather Stats for 2014\n');
    fprintf(toWrite, 'Total rain: %.3f\n', sum(totalRain));
    fprintf(toWrite, 'Total snow: %.3f\n', sum(totalSnow));
    
    % Create a list of all month names for printing
    monthNames = ['JanFebMarAprMayJunJulAugSepOctNovDec'];
    
    % Calculate average temperature
    avgHigh = [0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0];
    avgLow = [0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0];
    previousMonth = 1;
    ticker = 0;
    sizeOfTemp = size(high);
    for i = 1:sizeOfTemp(2)
        indexOf = months(i);
        if previousMonth ~= indexOf
            avgHigh(indexOf-1) = avgHigh(indexOf-1)/ticker;
            avgLow(indexOf-1) = avgLow(indexOf-1)/ticker;
            ticker = 0;
        end
        avgHigh(indexOf) = avgHigh(indexOf) + high(i);
        avgLow(indexOf) = avgLow(indexOf) + low(i);
        ticker = ticker+1;
        previousMonth = indexOf;
    end
    avgHigh(12) = avgHigh(12)/ticker;
    avgLow(12) = avgLow(12)/ticker;
    
    
    % Calculate hottest month
    index = 1;
    highest = -200;
    highestIndex = 0;
    for i = avgHigh
        if i > highest
            highest = i;
            highestIndex = index;
        end
        index = index + 1;
    end
    indexToPrint = (highestIndex-1)*3+1;
    fprintf(toWrite, 'The hottest temperature fell in %s with %.3f degrees.\n', monthNames(indexToPrint:indexToPrint+2), highest);
    
    % Calculate coldest month
    index = 1;
    lowest = 200;
    highestIndex = 0;
    for i = avgLow
        if i < highest
            highest = i;
            highestIndex = index;
        end
        index = index + 1;
    end
    indexToPrint = (highestIndex-1)*3+1;
    fprintf(toWrite, 'The lowest temperature fell in %s with %.3f degrees.\n', monthNames(indexToPrint:indexToPrint+2), highest);
    
    % Calculate hottest day
    index = 1;
    highest = -200;
    highestName = '';
    for i = high
        if highest < i
            highest = i;
            dateNameIndex = 8*(index-1)+1;
            highestName = dateNames(dateNameIndex:dateNameIndex+8);
        end
        index = index + 1;
    end
    fprintf(toWrite, 'The hottest day was %s with a temperature of %.1f.\n', highestName, highest);
    
    % Calculate coolest day
    index = 1;
    lowest = 100;
    lowestName = '';
    for i = high
        if lowest > i
            lowest = i;
            dateNameIndex = 8*(index-1)+1;
            lowestName = dateNames(dateNameIndex:dateNameIndex+8);
        end
        index = index + 1;
    end
    fprintf(toWrite, 'The coolest day was %s with a temperature of %.1f.\n', lowestName, lowest);
    
    % Calculate most rainfall
    index = 1;
    highest = -1;
    highestIndex = 0;
    for i = totalRain
        if i > highest
            highest = i;
            highestIndex = index;
        end
        index = index + 1;
    end
    indexToPrint = (highestIndex-1)*3+1;
    fprintf(toWrite, 'The largest rainfall fell in %s with a total of %.3f in. of rain.\n', monthNames(indexToPrint:indexToPrint+2), highest);
    
    % Calculate most snowfall
    index = 1;
    highest = -1;
    highestIndex = 0;
    for i = totalSnow
        if i > highest
            highest = i;
            highestIndex = index;
        end
        index = index + 1;
    end
    indexToPrint = (highestIndex-1)*3+1;
    fprintf(toWrite, 'The largest snowfall fell in %s with a total of %.3f in. of snow.', monthNames(indexToPrint:indexToPrint+2), highest);
    
    %% Finish up everything
    fclose(toWrite);
    fclose(fileId);
else
    fprintf('The file failed to open.')
end