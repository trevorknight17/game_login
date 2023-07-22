function shuffled_deck = deck_init

suit = {'Diamonds','Hearts','Clubs','Spades'};
nums = {'2','3','4','5','6','7','8','9','10','Jack','Queen','King','Ace'};

deck = cell(length(suit),length(nums));
for i = 1:length(suit)
    for j = 1:length(nums)
        deck{i,j} = strcat(nums{j},{'_of_'},suit{i});        
    end
end

shuffled_deck = deck(randperm(numel(deck)));

end