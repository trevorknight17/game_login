function replace_storage(howmany)

if howmany <= 0
    disp('Must be Positive')
    return
end

stor = [namegen(howmany), passrite(howmany)];

write(stor,'storage','FileType','spreadsheet')


disp('----------FILL STORAGE SUCCESS----------')
end