filterCompanies
load rawData.mat
finalRawData=[];
for i=1:length(filtered)
    data = dailyData.(filtered{i});
    dataYears = data(:,3);
    mask = dataYears >= 2013;
    data=data(mask,:);
    finalRawData.(filtered{i}) = data;
end