function wasOnTop = window_on_top(figureHandle,isOnTop)

drawnow expose
warnStruct=warning('off','MATLAB:HandleGraphics:ObsoletedProperty:JavaFrame');
jFrame = get(handle(figureHandle),'JavaFrame');
warning(warnStruct.state,'MATLAB:HandleGraphics:ObsoletedProperty:JavaFrame');
drawnow
if isa(figureHandle,'matlab.ui.Figure')
    jFrame_fHGxClient = jFrame.fHG2Client;
else
    jFrame_fHGxClient = jFrame.fHG1Client;
end
wasOnTop = jFrame_fHGxClient.getWindow.isAlwaysOnTop;
if ~isempty(isOnTop)
    jFrame_fHGxClient.getWindow.setAlwaysOnTop(isOnTop);
end

warn = lastwarn; %#ok<NASGU>

end