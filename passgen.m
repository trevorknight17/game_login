function pass = passgen(howlong)

up = 'A':'Z';
low = lower(up);
nums = ['0','1','2','3','4','5','6','7','8','9'];
special = ['!','@','#','$','%','^','&','*','(',')','_','-','+','+','[',...
    ']','{','}',':',';',',','.','<','>','/','?','\','|'];

options = strcat(up,low,nums,special);
random = randi(length(options),1,howlong);

pass = '';
for i = 1:howlong
    pass(i) = options(random(i));    
end

end