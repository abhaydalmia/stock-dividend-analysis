function getNASDAQData
    mainURL1 = 'http://www.nasdaq.com/symbol/';
    mainURL2 = '/dividend-history';
    counter = 0;
    load rawData.mat
    divData=[];
    for i=1:length(companyNames)
        currentDivData=[];
        URL = [mainURL1 companyNames{i} mainURL2];
        text = webread(URL);
        companyNames{i}
        ind1=strfind(text,'<tbody');
        if length(ind1) > 1
        ind2 = strfind(text,'</tbody>');
        text = text(ind1(2):ind2(2));
        startInd = strfind(text,'<span');
        endInd = strfind(text,'</span>');
        for j=1:length(startInd)
           current = text(startInd(j):endInd(j));
           [~,current] = strtok(current,'>');
           current = current(2:end-1);
           dashInd = strfind(current,'/');
           rowIndex = ceil(j/5);
           if (~strcmp(current,'--'))
            if mod(j,5) == 1
                day = str2num(current(1:dashInd(1)-1));
                month = str2num(current(dashInd(1)+1:dashInd(2)-1));
                year = str2num(current(dashInd(2)+1:end));
                currentDivData(rowIndex,1) = day;
                currentDivData(rowIndex,2) = month;
                currentDivData(rowIndex,3) = year;
                
            elseif mod(j,5) == 2
                currentDivData(rowIndex,4) = str2num(current);
            elseif mod(j,5) == 3
                day = str2num(current(1:dashInd(1)-1));
                month = str2num(current(dashInd(1)+1:dashInd(2)-1));
                year = str2num(current(dashInd(2)+1:end));
                currentDivData(rowIndex,5) = day;
                currentDivData(rowIndex,6) = month;
                currentDivData(rowIndex,7) = year;
            end
                    
           end
        end
        divData.(companyNames{i}) = currentDivData;
        end
        
    end
    %First ones are ex div dates. Next ones are announcement dates.
    divDataTitle = {'Day','Month','Year','Div Amount','Day','Month','Year'};
    
    save('divData.mat','divData','divDataTitle');
end