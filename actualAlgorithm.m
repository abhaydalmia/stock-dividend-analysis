load('finalCleanedData.mat');

for i=1:length(filtered)
    priceData = finalRawData.(filtered{i});
    divData = finalDivData.(filtered{i});
    [r,c] = size(divData);
    index = [];
    filtered{i}
    for j=1:r-1
        startDay = divData(j,2);
        startMonth = divData(j,1);
        startYear = divData(j,3);
        
        endDay = divData(j+1,2);
        endMonth = divData(j+1,1);
        endYear = divData(j+1,3);
        if startYear < 2016 || (startYear == 2016 && startMonth < 4)
        startRow = find(priceData(:,1)==startDay & priceData(:,2)==startMonth & priceData(:,3)==startYear);
        endRow = find(priceData(:,1)==endDay & priceData(:,2)==endMonth & priceData(:,3)==endYear);
        
        if (~(isempty(startRow) || isempty(endRow)))
        dataNew = priceData(endRow+1:startRow,8);
        [miniumum,indexMin] = min(dataNew);
        indexMin = length(dataNew) - indexMin(end);
        index = [index indexMin];
        end
        end
    end
    if ~isempty(index)
    finalData.(filtered{i}) = index;
    end
    
end