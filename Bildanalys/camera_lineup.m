vidRes = get(vid, 'VideoResolution');
nBands = get(vid, 'NumberOfBands');

hImage = image( zeros(vidRes(2), vidRes(1), nBands) );
hold on;
preview(vid, hImage);


load rawCorners;

plot(rawCorners(1:2,2), rawCorners(1:2,1));
plot(rawCorners(3:4,2), rawCorners(3:4,1));

load wheel_circle;

rectangle('Position', [c(1)-r,c(2)-r,2*r,2*r],...
    'Curvature', [1,1], 'EdgeColor', 'g')

waitfor(msgbox('Adjust the webcam to fit the lines then press OK', 'Camera Lineup','help'));