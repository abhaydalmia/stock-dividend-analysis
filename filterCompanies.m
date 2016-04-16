load('divData.mat');
companyNames = fieldnames(divData);
counter = 0;
for i = 1:length(companyNames)
    CD = divData.(companyNames{i});
    year = CD(end,3);
    if year < 2013
        [r,c] = size(CD);
        daysBetween=[];
        start = [num2str(CD(1,2)) '/' num2str(CD(1,1)) '/' num2str(CD(1,3))];
        for j = 2:r
        finish = [num2str(CD(j,2)) '/' num2str(CD(j,1)) '/' num2str(CD(i,3))];
        daysBetween = [daysBetween daysact(start,finish)];
        
        start = finish;
        end
        counter = counter+1;
    end
end
counter