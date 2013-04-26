
imaqreset;
vid = videoinput('winvideo',1,'RGB24_640x480')
source = getselectedsource(vid);
set(source,'ExposureMode','manual')
set(source,'FocusMode','manual')
source.focus = 110;
source.exposure = -3;


% Get image and display it.
rgbImage = getsnapshot(vid);


% Save this image to disk.
fullImageFileName = fullfile(pwd, 'myfirstimage5.jpg');
imwrite(rgbImage,fullImageFileName);