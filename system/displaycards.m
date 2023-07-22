function displaycards(cards,location,whose,fignum)

path = strcat(pwd,'\cardimages');

images = cell(length(cards),1);
for i = 1:length(cards)
    images{i} = imread(strcat(path,'\',cards{i},'.png'));
end

f(fignum) = figure(fignum);
set(gcf,'position',[0,0,500,250])
p = uipanel('Parent',f(fignum));
if fignum == 1
    p.Title = strcat(whose,strcat({' '},'(Revealed Total = ',{' '},num2str(sumcards(cards)),'):'));
elseif fignum == 2
    p.Title = strcat(whose,strcat({' '},'(Total = ',{' '},num2str(sumcards(cards)),'):'));
end
p.TitlePosition = 'centertop';
p.FontSize = 12;
p.FontWeight = 'bold';
for i = 1:length(cards)
    subplot(1,length(cards),i,'Parent',p);
    imshow(images{i},'Border','tight');
    movegui(f(fignum),location)
end

window_on_top(f(fignum),1);

end