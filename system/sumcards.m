function total = sumcards(cards)

value = cell(length(cards),1);
for i = 1:length(cards)
    value{i} = regexprep(cards{i},'_of.*','','ignorecase');
    if strcmp(value{i},'Jack') || strcmp(value{i},'Queen')...
            || strcmp(value{i},'King')
        value{i} = 10;
    elseif strcmp(value{i},'Ace')
        value{i} = 11;
    elseif strcmp(value{i},'cardbackred')
        value{i} = 0;
    else
        value{i} = str2double(value{i});
    end
end
total = 0;
for i = 1:length(cards)
    total = total + value{i};
end

if total > 21
    for i = 1:length(cards)
        if value{i} == 11
            value{i} = 1;
            total = 0;
            for j = 1:length(cards)
                total = total + value{j};
            end
            if total > 21
                for k = 1:length(cards)
                    if value{k} == 11
                        value{k} = 1;
                        total = 0;
                        for x = 1:length(cards)
                            total = total + value{x};
                        end
                        if total > 21
                            for y = 1:length(cards)
                                if value{y} == 11
                                    value{y} = 1;
                                    total = 0;
                                    for z = 1:length(cards)
                                        total = total + value{z};
                                    end
                                    if total > 21
                                        for a = 1:length(cards)
                                            if value{a} == 11
                                                value{a} = 1;
                                                total = 0;
                                                for b = 1:length(cards)
                                                    total = total + value{b};
                                                end
                                                break
                                            end
                                        end
                                    end
                                    break
                                end
                            end
                        end
                        break
                    end
                end
            end
            break
        end
    end
end
end