companyNames = fieldnames(finalData);
for i=1:length(companyNames)
    indexes = finalData.(companyNames{i});
    numberConform = [];
    for j=1:length(indexes)
        index = indexes(j);
        mask = find(indexes> index-3 & indexes<index+3);
        numberConform = [numberConform length(mask)];
    end
    [~,ind] = max(numberConform);
    finalIndex = indexes(ind(end));
    final.(companyNames{i})=finalIndex;
end
