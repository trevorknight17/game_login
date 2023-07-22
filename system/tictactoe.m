function tictactoe

clc

disp(strcat(mfilename,'.m initializing...'))
pause(1)

global board
global redo
global xy

board = {'[ ]','[ ]','[ ]';'[ ]','[ ]','[ ]';'[ ]','[ ]','[ ]'};
disp('Welcome to Tic Tac Toe!')
disp(' ')
disp(board)
disp('Logged in user goes first')

win = 0;
seq = 1;
while win == 0
    xy_ind = rem(seq,2);
    x = ' X ';
    o = ' O ';
    if xy_ind == 1
        xy = x;
    else
        xy = o;
    end
    
    redo = 1;
    while redo == 1
        row = input('Choose Row: ');
        column = input('Choose Column: ');
        if isempty(row) || isempty(column)
            disp('Not a valid location')
            continue
        elseif row > 3 || column > 3
            disp('Not a valid location')
            continue
        elseif ischar(row) || ischar(column)
            disp('Not a valid location')
            continue
        end
        
        clc
        place(xy,row,column)
    end
    
    for i = 1:length(board)
        if strcmp(board{i,1},x) && strcmp(board{i,2},x) && strcmp(board{i,3},x) == 1 ...
                || strcmp(board{1,i},x) && strcmp(board{2,i},x) && strcmp(board{3,i},x) == 1 ...
                || strcmp(board{1,1},x) && strcmp(board{2,2},x) && strcmp(board{3,3},x) == 1 ...
                || strcmp(board{1,3},x) && strcmp(board{2,2},x) && strcmp(board{3,1},x) == 1
            win = 1;
            disp('''X'' wins the game!')
            addscore
        elseif strcmp(board{i,1},o) && strcmp(board{i,2},o) && strcmp(board{i,3},o) == 1 ...
                || strcmp(board{1,i},o) && strcmp(board{2,i},o) && strcmp(board{3,i},o) == 1 ...
                || strcmp(board{1,1},o) && strcmp(board{2,2},o) && strcmp(board{3,3},o) == 1 ...
                || strcmp(board{1,3},o) && strcmp(board{2,2},o) && strcmp(board{3,1},o) == 1
            win = 1;
            disp('''O'' wins the game!')
            winner = input('Who was player ''O''?: ','s');
            addscore(winner)
        end
    end
    
    seq = seq + 1;
    if seq == 10 && win == 0
        disp('Cat''s Game!')
        win = 1;
    end
end

    function place(xy,x,y)
        if strcmp(board{x,y},'[ ]') == 1
            board{x,y} = xy;
            redo = 0;
            if strcmp(xy,' X ') == 1
                disp('X''s turn')
            elseif strcmp(xy,' O ') == 1
                disp('O''s turn')
            end
            disp(board)
        else
            redo = 1;
            disp('Move not allowed')
            if strcmp(xy,' X ') == 1
                disp('X''s turn')
            elseif strcmp(xy,' O ') == 1
                disp('O''s turn')
            end
            disp(board)
        end
    end

end