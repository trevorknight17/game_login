function clearleaderboard

password = '12345678';

pass = input('Enter password: ','s');
if strcmp(pass,password)
    delete('leaderboard.xlsx')
    load('temp_user.mat','user')
    basescore = {user,'0'};
    xlswrite('leaderboard.xlsx',basescore)
    disp('Leaderboard cleared')
    pause(1.5)
    clc
else
    disp('Incorrect Password')
    pause(1.5)
    clc
end

end