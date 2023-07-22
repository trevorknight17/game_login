function clearleaderboard

pass = input('Enter password: ','s');
if strcmp

delete('leaderboard.xlsx')
load('temp_user.mat')
basescore = {user,'0'};
xlswrite('leaderboard.xlsx',basescore)
disp('Leaderboard cleared')
pause(1.5)
clc

end