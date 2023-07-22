function pass_store = passrite(howmany)

long = zeros(howmany,1);
p_store = cell(howmany,1);
for i = 1:howmany
    long(i) = randi([8,20]);
    p_store{i} = passgen(long(i));
end

pass_store = cell2table(p_store);
write(pass_store,'p_storage','FileType','text')


end