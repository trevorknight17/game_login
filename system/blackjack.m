function blackjack

erase

disp(strcat(mfilename,'.m initializing...'))
load('temp_user.mat')
pause(1)

play = 1;
while play == 1
    
    deck = deck_init;
    disp('Welcome to Blackjack!')
    
    loop = 1;
    iteration = 1;
    dealer_iteration = 0;
    while loop == 1
        if iteration == 1
            dealercards = [deck{1},deck{2}];
            displaycards(['cardbackred', deck{2}],'north','Dealer''s cards',1)
            dealertotal = sumcards(dealercards);
            usercards = [deck{3},deck{4}];
            displaycards(usercards,'northeast','Your cards',2)
            usertotal = sumcards(usercards);
            if usertotal == 21
                disp('You Win!')
                addscore
                loop = 0;
                continue
            end
        end
        
        action = lower(input('Would you like to hit or stay?: ','s'));
        
        clc
        
        if strcmp(action,'stay') == 0 && strcmp(action,'hit') == 0
            disp('Invalid input')
            disp('Only options are ''stay'' or ''hit''')
            pause(2)
            continue
        end
        
        while dealertotal < 17
            dealercards(end + 1) = deck{(length(deck) - dealer_iteration)}; %#ok<AGROW>
            dealertotal = sumcards(dealercards);
            dealer_iteration = dealer_iteration + 1;
        end
        
        if strcmp(action,'stay') == 1
            displaycards(dealercards,'north','The Dealer''s cards',1)
            disp('Dealer total:')
            disp(strcat('Dealer total: ',{' '},num2str(dealertotal)))
            displaycards(usercards,'northeast','Your cards',2)
            disp('Your total:')
            disp(strcat('User total: ',{' '},num2str(usertotal)))
            if dealertotal > 21
                disp('You Win!')
                addscore
            elseif usertotal > dealertotal
                disp('You Win!')
                addscore
            elseif usertotal == dealertotal
                disp('Draw!')
            elseif usertotal < dealertotal
                disp('You Lose!')
                addscore(user,-1)
            end
            loop = 0;
        elseif strcmp(action,'hit') == 1
            displaycards(['cardbackred', deck{2}],'north','Dealer''s cards',1)
            usercards(end + 1) = deck{4 + iteration}; %#ok<AGROW>
            displaycards(usercards,'northeast','Your cards ',2)
            usertotal = sumcards(usercards);
            if usertotal > 21
                disp('Busted!')
                addscore(user,-1)
                loop = 0;
            elseif usertotal == 21
                disp('You Win!')
                addscore
                loop = 0;
            end
        end
        
        iteration = iteration + 1;
    end
    
    if loop == 0
        replay = 0;
        while replay == 0
            again = lower(input('Would you like to play again? ','s'));
            if strcmp(again,'yes') == 1
                replay = 1;
                clc
                close all
            elseif strcmp(again,'no') == 1
                replay = 1;
                play = 0;
                clc
                close all
            end
        end
        
    end
    
end
end