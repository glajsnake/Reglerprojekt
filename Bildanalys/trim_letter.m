function trimmed_letter = trim_letter(im)
%TRIM_LETTER trims an image of a letter and a number assuming that the
%letter is bigger than the number (pixels).


shape = strel('disk', double(uint16(length(im)/10)), 0);

%nomalize
imtrim = im - min(im(:));
imtrim = imtrim / max(imtrim(:));

peak = peakfinder(hist(imtrim(:),255));

threshold = max(peak) - std(imtrim(:));


if size(imtrim,3) == 3
    imb = imtrim(:,:,1)<threshold & imtrim(:,:,3)<threshold & imtrim(:,:,2) < threshold;
else
    imb = mean(imtrim,3) > threshold;
end

[imlabels num] = bwlabel(bwconvhull(~imb,'objects'));



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


