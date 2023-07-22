function logout

disp('Logging Out...')
if exist('temp_user.mat','file')
    delete('temp_user.mat')
    disp('Logged out')
    pause(2)
    clc
    return
end

end