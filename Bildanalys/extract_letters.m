function letters = extract_letters(im, rect)
%EXTRACT_LETTERS returns the letters on the Ruzzle playing screen
%im - image of the playing field
%rect - optional, if the picture contains more than the playing field rect
%specifies the part that is the playing screen. rect = [row_start col_start height width]

if nargin == 2
    im = im(rect(1):rect(1)+rect(3), rect(2):rect(2)+rect(4),:);
end

img = mean(im, 3);

peak = peakfinder(hist(img(:),255));

imb = img > peak(find(peak==max(peak))) - std(img(:)); %img > mean(img(:))-std(img(:));%max(img(:))-( max(img(:)-min(img(:)))*.25 );

imlabels = bwlabel(bwconvhull(imb,'objects'));
[row col v] = find(imlabels);
rect_trimmed = [min(row) min(col) max(row)-min(row) max(col)-min(col)]; %trimmed rect




%extract letters
for c = 1:4
    for r = 1:4
        %get label number
        label_number = imlabels(uint16(rect_trimmed(1)+(0.25*c - 0.125)*rect_trimmed(3)), ...
                                uint16(rect_trimmed(2)+((0.25*r - 0.125) * rect_trimmed(4))));
        
        %extract all corresponding pixels
        [nrow ncol] = find(imlabels == label_number);
        
        %find lower right corner
        corner = [max(nrow), max(ncol)];
        
        %segment image
        letters{r + (c-1)*4} = im( max(1,round(corner(1)-0.2*rect_trimmed(3))):corner(1) , ...
                                   max(1,round(corner(2)-0.2*rect_trimmed(4))):corner(2) , :);

    end
end

