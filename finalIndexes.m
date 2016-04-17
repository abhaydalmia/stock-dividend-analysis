companyNames = fieldnames(finalData);
for i=1:length(companyNames)
    indexes = finalData.(companyNames{i});
    numberConform = [];
    for j=1:length(indexes)
        index = indexes(j);
        mask = find(indexes> index-5 & indexes<index+5);
        numberConform = [numberConform length(mask)];
    end
    [~,ind] = max(numberConform);
    finalIndex = indexes(ind(end));
    final1.(companyNames{i})=finalIndex;
end
