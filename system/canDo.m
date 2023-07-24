function canDo

clc

load('temp_user.mat','user');

[~, ~, allowed] = xlsread(strcat(pwd,'\permissions\',user,'_perms.xls'));

for i = 1:length(allowed)
    allowed{i} = allowed{i}(1:end-2);    
end

disp(allowed)

end