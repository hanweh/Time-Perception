Noise.size = [900,1740];
Screen('Preference', 'SkipSyncTests', 1);
% whichscreen=max(Screen('Screens'));
[windowPtr,rect] = Screen('OpenWindow',0,0,[0 0 1740 900]);
for i = 1:17
    Noise.lumi = 100.*rand(Noise.size);
    Noise.tex = Screen('MakeTexture', windowPtr, Noise.lumi, [], 1);
    Screen('DrawTexture', windowPtr, Noise.tex);
    Screen('Flip',windowPtr);
    img = Screen('GetImage',windowPtr);
    picture_name = ['yy',num2str(i),'.jpg'];
    imwrite(img,picture_name);
end
Screen('CloseAll');