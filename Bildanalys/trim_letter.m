function trimmed_letter = trim_letter(im)
%TRIM_LETTER trims an image of a letter and a number assuming that the
%letter is bigger than the number (pixels).


%grayscale
imtrim = mean(im,3);
%normalize
imtrim = imtrim - min(imtrim(:));
imtrim = imtrim / max(imtrim(:));
peak = peakfinder(hist(imtrim(:),255)) / 255;

imb = imtrim > max(peak) - 2*std(imtrim(:));



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



trimmed_letter = imb(lrb:lre, lcb:lce,:);


