function version_info

%%% Displays info related to current version

version.typ = ' develop';
version.ind = ' V ';
version.maj = '1';
version.min = '0';
version.pat = '1';
version.upd = char(datetime('now','TimeZone','local','Format','d-MMM-y HH:mm:ss Z'));

details = strcat('Current Version:',version.typ,version.ind,version.maj,'.',version.min,'.',version.pat);

fid = fopen('version_info.txt','w');
fprintf(fid, '%s\n', details);
fprintf(fid, '%s\n', version.upd);
fclose(fid);

disp(details)
disp(version.upd)

end