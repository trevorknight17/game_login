%function canDo

w = what;
mfiles = w.m;

load('temp_user.mat');

[~, ~, allowed] = xlsread(strcat(pwd,'\permissions\',user,'_perms.xls'));

% for i = 1:length(mfiles)
%     for j = 1:length(notallowed)
%         if strcmp(mfile{i},allowedd{j})
%             
%         end
%     end
% end

for i = 1:length(mfiles)
    mfiles{i} = mfiles{i}(1:end-2);
end

%end