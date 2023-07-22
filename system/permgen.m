function permgen

w = what;
mfiles = w.m;

load(strcat(regexprep(pwd,'system','','ignorecase'),'\temp.mat'))
xlswrite(strcat(pwd,'\permissions\',user,'_perms'),mfiles)

end