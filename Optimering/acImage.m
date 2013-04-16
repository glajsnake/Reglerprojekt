clc;
clear all;
imaqreset;
vid = videoinput('winvideo',2)

% Set video input object properties for this application.
% Note that example uses both SET method and dot notation method.
set(vid,'TriggerRepeat',0);
vid.FrameGrabInterval = 10;

% Set value of a video source object property.
vid_src = getselectedsource(vid)
set(vid_src,'Tag','CAM')
vid.FramesPerTrigger = 1;
triggerconfig(vid, 'manual');

start(vid);



fontSize = 12;

% Get image and display it.
rgbImage = getsnapshot(vid);

stop(vid);
subplot(1,2, 1);
imshow(rgbImage);
title('Initial Image', 'FontSize', fontSize);
% Enlarge figure to full screen.
set(gcf, 'Position', get(0,'Screensize'));

% Save this image to disk.
fullImageFileName = fullfile(pwd, 'myfirstimage.jpg');
imwrite(rgbImage,fullImageFileName);