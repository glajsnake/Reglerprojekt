imaqreset;
videos = imaqhwinfo('winvideo');

for i = videos.DeviceIDs
    video = imaqhwinfo('winvideo', i{1});
    if strcmp(video.DeviceName,  'Logitech Webcam Pro 9000')
    
        camnum = i{1};
        break;
    end
end
if ~exist('camnum')
    error('Connect the Logitech Webcam Pro 9000');
end

vid = videoinput('winvideo',camnum,video.SupportedFormats{1})
source = getselectedsource(vid);
set(source,'ExposureMode','manual')
set(source,'FocusMode','manual')
set(source,'WhiteBalanceMode','manual')
source.focus = 143;
source.exposure = -3;
source.WhiteBalance = 6000;
source.brightness = 170;
source.horizontalflip = 'on';
source.verticalflip = 'on';
vid.ReturnedColorspace = 'rgb';