function changepassword

if exist('storage.xls','file') == 0
    disp('No users in database')
    return
end

base = readtable('storage.xls');

user = input('Enter Username: ', 's');

user_st = zeros(height(base),1);
for i = 1:height(base)
    if strcmp(user,base{i,1}) == 1
        user_st(i,1) = 1;
        idx = i;
        disp('User Exists')
    elseif strcmp(user,base{i,1}) == 0
        user_st(i,1) = 0;
    end
end

if user_st == zeros(height(base),1)
    disp('User Does Not Exist')
    pause(2)
    clear, clc
    return
end

pass = input('Enter Current Password: ', 's');

if strcmp(pass,base{idx,2}) == 1
    disp('Access Granted')
    clc
elseif strcmp(pass,base{idx,2}) == 0
    disp('Password Incorrect: Access Denied')
    pause(2)
    clear,clc
    return
end

new_pass = input('Enter New Password: ','s');

if length(new_pass) < 8
    disp('Password is too short')
    return
end

base = table2array(base);
base{idx,2} = new_pass;

write(cell2table(base),'storage','FileType','spreadsheet')
disp('Password Updated Successfully')

pause(2)

clear,clc

end