function signup

base = readtable('storage.xls');

user = input('Create Username: ', 's');

if length(user) < 5 || length(user) > 25
    disp('Username must be 5 to 25 characters')
    return
end

for i = 1:height(base)
    if strcmp(user,base{i,1}) == 1
        disp('User already exists')
        return
    end
end

pass = input('Create Password: ', 's');

if length(pass) < 8
    disp('Password is too short')
    return
end

base = table2array(base);
base{end + 1,1} = user;
base{end,2} = pass;

save(fullfile(pwd,'temp'),'user');

write(cell2table(base),'storage','FileType','spreadsheet')
disp('Establishing Permissions...')
run(strcat(pwd,'\system\permgen'))
disp('Account Created Successfully')

pause(2)

clear, clc

end