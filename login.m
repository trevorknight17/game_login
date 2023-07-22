function login

if exist('storage.xls','file') == 0
    disp('No users in database')
    return
end

base = readtable('storage.xls');

loop = 1;
while loop == 1
    
    user = input('Enter Username: ', 's');
    if strcmp(user,'exit')
        disp('Exiting login page...')
        pause(1)
        clc
        return        
    end
    
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
        clc
        continue
    end
    
    pass = input('Enter Password: ', 's');
    
    if strcmp(pass,'exit')
        disp('Exiting login page...')
        pause(1)
        clc
        return        
    end
    
    if strcmp(pass,base{idx,2}) == 1
        disp('Access Granted')
        loop = 0;
    elseif strcmp(pass,base{idx,2}) == 0
        disp('Password Incorrect: Access Denied')
        pause(2)
        clc
        continue
    end
    
    pause(2)
    
end

path = strcat(pwd,'\system');

save(fullfile(path,'temp_user'),'user');

clearvars -except path
clc

run([path,'\welcome'])

end