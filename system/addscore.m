function addscore(varargin)

[~, ~, alldata] = xlsread('leaderboard.xlsx');
users = alldata(:,1);
score = table2array(cell2table(alldata(:,2)));

storage = strcat((regexprep(pwd,'system.*','','ignorecase')),'storage.xls');
base = readtable(storage);

if nargin == 0
    user = load('temp_user.mat');
    winner = user.user;
    howmuch = 1;
elseif nargin == 1
    winner = varargin{1};
    howmuch = 1;
elseif nargin == 2
    winner = varargin{1};
    howmuch = varargin{2};
else
    disp('Too many arguments')
    pause(1.5)
    return
end

user_st = zeros(height(base),1);
for i = 1:height(base)
    if strcmp(winner,base{i,1}) == 1
        user_st(i,1) = 1;
    elseif strcmp(winner,base{i,1}) == 0
        user_st(i,1) = 0;
    end
end

if user_st == zeros(height(base),1)
    disp('User Does Not Exist')
    disp('Score change unsuccessful')
    pause(2)
    clc
    return
end


for i = 1:length(users)
    if strcmp(users{i},winner) == 1
        score(i,1) = score(i,1) + howmuch;
        score = table2cell(array2table(score));
        alldata{i,2} = cell2mat(score(i));
    end
end

if strcmp(users,winner) == zeros(length(users),1)
    users{length(users) + 1,1} = winner;
    score(length(score) + 1,1) = howmuch;
    score = table2cell(array2table(score));
    alldata{length(users),1} = winner;
    alldata{length(score),2} = cell2mat(score(end));
end

xlswrite('leaderboard.xlsx',alldata);

end