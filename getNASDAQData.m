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
           current = strtok(current,'>');
           current = current(1:end-1);
           dashInd = strfind(current,'/');
            if mod(j,5) == 1
                day = str2double(current(1:dashInd(1)));
                month = str2double(current(dashInd(1)+1:dashInd(2)));
                year = str2double(current(dashInd(2)+1:end));
                currentDivData(j,1) = day;
                currentDivData(j,2) = month;
                currentDivData(j,3) = year;
                
            elseif mod(j,5) == 2
                currentDivData(j,4) = str2double(current);
            elseif mod(j,5) == 3
                day = str2double(current(1:dashInd(1)));
                month = str2double(current(dashInd(1)+1:dashInd(2)));
                year = str2double(current(dashInd(2)+1:end));
                currentDivData(j,5) = day;
                currentDivData(j,6) = month;
                currentDivData(j,7) = year;
            end
                    
        end
        end
    end
    
end