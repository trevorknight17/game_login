function permgen

w = what;
mfiles = w.m;

load(strcat(regexprep(pwd,'system','','ignorecase'),'\temp.mat'),'user')

restricted = {'addscore.m','deck_init.m','displaycards.m','erase','permgen.m','sumcards.m','welcome.m','welcome_img.m','window_on_top.m'};

allow = setdiff(mfiles,restricted);

xlswrite(strcat(pwd,'\permissions\',user,'_perms'),allow)

end