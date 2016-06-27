function toReturn = correlationCoefficient(Xs, Ys)
%    SSN = 0;
%    for i = 1:length(Xs)
%        SSN = SSN + (Ys(i) - a * Xs(i)^2 - b * Xs(i) - c)^2;
%        %SSN = SSN + (Ys(i) - b * Xs(i) - c)^2;
%    end
%    SSE = 0;
%    for i = 1:length(Xs)
%        SSE = SSE + (Ys(i) - YY)^2;
%    end
%    toReturn = sqrt(1 - (SSN/SSE));
    xMean = mean(Xs);
    yMean = mean(Ys);
    
    %deviationIntermediate = [];
    %for i = 1:length(Xs)
    %    deviationIntermediate(i) = (Xs(i) - xMean)^2;
    %end
    %std(Xs)
    %xDeviation = sqrt(mean(deviationIntermediate))
    xDeviation = std(Xs);
    
    %deviationIntermediate = [];
    %for i = 1:length(Xs)
    %    deviationIntermediate(i) = (Ys(i) - yMean)^2;
    %end
    %yDeviation = sqrt(mean(deviationIntermediate))
    yDeviation = std(Ys);
    
    xIntermediate = [];
    for i = 1:length(Xs)
        xIntermediate(i) = (Xs(i) - xMean) / xDeviation;
    end
    yIntermediate = [];
    for i = 1:length(Ys)
        yIntermediate(i) = (Ys(i) - yMean) / yDeviation;
    end
    
    sumOfIntermediates = 0;
    for i = 1:length(xIntermediate)
        sumOfIntermediates = sumOfIntermediates + (xIntermediate(i)*yIntermediate(i));
    end
    
    toReturn = sumOfIntermediates / (length(Xs) - 1);
end