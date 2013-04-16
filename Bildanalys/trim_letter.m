function trimmed_letter= trim_letter(im)
%TRIM_LETTER trims an image of a letter and a number assuming that the
%letter is bigger than the number (pixels).


shape = strel('disk', double(uint16(length(im)/10)), 0);

threshold = 100;
imb = im(:,:,1)<threshold & im(:,:,3)<threshold & im(:,:,2) < threshold;
%merge ��� to one blob
imb = imdilate(imb,shape);
imb = imerode(imb,shape);
[imlabels num] = bwlabel(bwconvhull(imb,'objects'));



[row col value] = find(imlabels);

if imlabels(round(size(imlabels,1)/2), round(size(imlabels,2)/2)) ~= 0
    letterlabel = imlabels(round(size(imlabels,1)/2), round(size(imlabels,2)/2));
else
    letterlabel = mode(value);
end
%l r/c b/e -> letter row/column begin/end
lrb = min(row(value==letterlabel));
lcb = min(col(value==letterlabel));
lre = max(row(value==letterlabel));
lce = max(col(value==letterlabel));



trimmed_letter = im(lrb:lre, lcb:lce,:);


