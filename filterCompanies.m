load('divData.mat');
load('rawData.mat');
companyNames = fieldnames(divData);
counter = 0;
filtered = {};
finalDivData=[];

for i = 1:length(companyNames)
    CD = divData.(companyNames{i});
    dataa = dailyData.(companyNames{i});
    dataYears = dataa(:,3);
    dataYears = sum(dataYears < 2013);
    year = CD(end,3);
    yearNew = CD(1,3);
    if year < 2013 && yearNew >= 2015 && dataYears > 1
        daysBetween=[];
        start = [num2str(CD(1,1)) '/' num2str(CD(1,2)) '/' num2str(CD(1,3))];
        allYears = CD(:,3);
        allYears = find(allYears < 2013);
        CD(allYears(1):end,:)=[];
        [r,c] = size(CD);
        for j = 2:r
        finish = [num2str(CD(j,1)) '/' num2str(CD(j,2)) '/' num2str(CD(j,3))];
        daysBetween = [daysBetween daysact(finish,start)];
        start = finish;
        end
        difference = abs(diff(daysBetween)) > 10;
        difference = find(difference);
        if isempty(difference)
        [r,c] = size(CD);
        if r > 3
        finalDivData.(companyNames{i}) = CD;
        filtered = [filtered companyNames(i)];
        counter = counter+1;
        end
        end
    end
end