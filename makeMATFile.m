function makeMATFile
cd('RawData')
listing = dir;
names={};
for i=1:length(listing)
    names{i}=listing(i).name;
end
names(1:2)=[];
title={'Day','Month','Year','Date','Open','High','Low','Close','Volume','OpenInt'};
dailyData=[];
companyNames={};
for i=1:length(names)
   companyName = strtok(names{i},'.');
   raw = importdata(names{i});
   if ~isempty(raw)
   raw = raw.data;
   dates = raw(:,1);
   day = mod(dates,100);
   month = floor(dates/100);
   month = mod(month,100);
   year = floor(dates/10000);
   raw = [day month year raw];
   dailyData.(companyName) = raw;
   companyNames = [companyNames {companyName}];
   end
end
titleRawData = title;
cd ('../')
save('rawData.mat','dailyData','titleRawData','companyNames')


