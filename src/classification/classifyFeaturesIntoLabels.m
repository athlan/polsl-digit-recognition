function [ CLASS, ERR, POSTERIOR, LOGP, COEF ] = classifyFeaturesIntoLabels(F, labels, trainingSetRatio, classificationType)
%CLASSIFICATIONQDA Summary of this function goes here
%   Detailed explanation goes here

    validatingSetRatio = 0; % ile procent na zbi�r walidacyjny
    testingSetRatio = 1 - trainingSetRatio - validatingSetRatio;  % procent na zbi�r testowy
    
    % macierze z numerami indeks�w za pomoc�, kt�rych b?dziemy odpowiednio
    % dane przydziela? do zbioru treningowego i testowego
    testingSetIndices = [];            % tworzy pust� macierz na zbior testowy
    validatingSetIndices = [];         % tworzy pust� macierz na zbior walidacyjny (u nas opcjonalny)
    trainingSetIndices = [];           % tworzy pust� macierz na zbior treningowy
    
    [trainingSetIndices,validatingSetIndices,testingSetIndices] = dividerand(size(F,1),trainingSetRatio,validatingSetRatio,testingSetRatio);
    
    testingSetSize = numel(testingSetIndices);
    trainingSetSize = numel(trainingSetIndices);
    validatingSetSize = numel(validatingSetIndices);
    
    testingSet(1:testingSetSize) = 0;
    %testingSetLabels(1:testingSetSize) = 0;
    for i = 1: testingSetSize
        testingSet(i) = F(testingSetIndices(i));
        %testingSetLabels(i) = labels(testingSetIndices(i));
    end
    
    trainingSet(1:trainingSetSize) = 0;
    trainingSetLabels(1:trainingSetSize) = 0;
    for i = 1: trainingSetSize
        trainingSet(i) = F(trainingSetIndices(i));
        trainingSetLabels(i) = labels(trainingSetIndices(i));
    end
    
    [ CLASS, ERR, POSTERIOR, LOGP, COEF ] = classify(testingSet', trainingSet', trainingSetLabels, classificationType);
end
