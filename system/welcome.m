function welcome
               disp('%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%')
               disp('                   Welcome                    ')
               disp('%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%')
               disp('                                              ')
welcome_img

pause(1)

run(strcat(regexprep(pwd,'system','version_info.m')));

disp('Verifying Permissions...')
load('temp_user.mat')
source_dir = pwd;
d = dir([source_dir, '\*.m']);
funcs = cell(length(d),1);
for i = 1:length(d)
    funcs{i} = d(i).name;
end
disp('Operation Complete')

loggedin = 1;
iteration = 1;
while loggedin == 1
    deny = strcat(mfilename,'.m');
    
    if iteration > 1
        disp('What would you like to do next?')
    end
    do = strcat(input('Task: ', 's'),'.m');
    
    if strcmp(do,deny)
        disp('Permission Denied')
        pause(1.5)
        clc, continue
    elseif strcmp(do,'logout.m')
        loggedin = 0;
    end
    
    notfunc = eye(length(funcs));
    for i = 1:length(funcs)
        if strcmp(do,funcs{i,1}) == 1 || strcmp(strcat(regexprep(do,'(.*','','ignorecase'),'.m'),funcs{i,1})
            continue
        else
            notfunc(i,i) = 0;
        end
    end
    
    if notfunc == zeros(length(funcs))
        disp('Function does not exist')
        pause(1.5)
        clc, continue
    else
        disp('Accessing...')
        pause(1)
        run(do)
    end
    iteration = iteration + 1;
end

end