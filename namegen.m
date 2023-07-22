function name_store = namegen(howmany)

name = readtable('names.xlsx');

boy = table2cell(name(:,1));
girl = table2cell(name(:,2));
nums = ['0','1','2','3','4','5','6','7','8','9'];

type = zeros(howmany,1);
ord = zeros(howmany,1);
idx1 = zeros(howmany,1);
idx2 = zeros(howmany,1);
idx3 = zeros(howmany,1);
idx4 = zeros(howmany,1);
n_store = cell(howmany,1);
for i = 1:howmany
    type(i) = randi([0,1]);
    ord(i) = randi([1,4]);
    idx1(i) = randi([1,height(name)]);
    idx2(i) = randi([1,height(name)]);
    idx3(i) = randi([1,length(nums)]);
    idx4(i) = randi([1,length(nums)]);
    if type(i) == 0 && ord(i) == 1
            n_store{i} = strcat(boy(idx1(i)),nums(idx3(i)),...
                nums(idx4(i)),girl(idx2(i)));            
    end
    if type(i) == 0 && ord(i) == 2
            n_store{i} = strcat(boy(idx1(i)),nums(idx3(i)),...
                nums(idx4(i)),boy(idx2(i)));            
    end
    if type(i) == 0 && ord(i) == 3
            n_store{i} = strcat(girl(idx1(i)),nums(idx3(i)),...
                nums(idx4(i)),boy(idx2(i)));            
    end
    if type(i) == 0 && ord(i) == 4
            n_store{i} = strcat(girl(idx1(i)),nums(idx3(i)),...
                nums(idx4(i)),girl(idx2(i)));            
    end
    if type(i) == 1 && ord(i) == 1
            n_store{i} = strcat(boy(idx1(i)),girl(idx2(i)),...
                nums(idx3(i)),nums(idx4(i)));            
    end
    if type(i) == 1 && ord(i) == 2
            n_store{i} = strcat(boy(idx1(i)),boy(idx2(i)),...
                nums(idx3(i)),nums(idx4(i)));            
    end
    if type(i) == 1 && ord(i) == 3
            n_store{i} = strcat(girl(idx1(i)),boy(idx2(i)),...
                nums(idx3(i)),nums(idx4(i)));            
    end
    if type(i) == 1 && ord(i) == 4
            n_store{i} = strcat(girl(idx1(i)),girl(idx2(i)),...
                nums(idx3(i)),nums(idx4(i)));            
    end
    
name_store = cell2table(n_store);
write(name_store,'n_storage','FileType','text')
    
end

end