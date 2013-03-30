%tests the functions in bildanalys
close all
imnum = 1;
for i = 1:21
    i
    path = pwd;
    impath = [path(1:find(path == filesep, 1 , 'last')) 'Spelplaner - manuell' filesep int2str(i) '.png'];
    im = imread(impath);
    
    letters = extract_letters(im);
    
    figure
    subplot(8,4,[1:16]);
    imagesc(im);
    
    for num = 1:16
        subplot(8,4, num+16);
        imagesc(letters{ceil(num/4), mod(num-1,4)+1})
    end

    
    for num = 1:16
        imwrite(letters{num}, [ 'output' filesep int2str(imnum) '.png'], 'png');
        imnum = imnum+1;
    end    
    

end
