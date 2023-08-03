function notes

erase

load('temp_user.mat','user')
disp([user '''s' ' ' mfilename ' initializing...'])
pause(1)

task = 1;
while task == 1
    
    do = lower(input('[Notes]: What would you like to do? ','s'));
    
    if strcmp(do,'edit')
        system(['notepad ' pwd '\notes\' user '_notes']);
    elseif strcmp(do,'exit')
        task = 0;
        disp('Exiting notes...')
        pause(1.5)
        clc
    elseif strcmp(do,'delete')
        confirm = input('Enter ''DELETE'' to confirm action: ','s');
        if strcmp(confirm,'DELETE')
            if exist([pwd '\notes\' user '_notes.txt'],'file')
                delete([pwd '\notes\' user '_notes.txt'])
                disp('Deletion Successful')
                pause(1.5)
                clc
            else
                disp('There are no notes to delete!')
                pause(1.5)
                clc
                continue
            end
        else
            disp('Invalid Confirmation')
            disp('Deletion Unsuccessful')
            pause(1.5)
            clc
            continue
        end
    end
    
    fclose('all');
    
end

end