function leaderboard

clc

[~, ~, alldata] = xlsread('leaderboard.xlsx');
alldata = sortrows(alldata,-2);

disp('Top 5 Scores: ')
if size(alldata,1) < 5
    disp(alldata)
else
    disp(alldata(5,:))
end

end