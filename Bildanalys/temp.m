clear all
mh = 0;
mw = 0;
for i = 1:26
    im{i} = trim_letter(imread(['output' filesep (i+'A'-1) '.png']));
    [h{i} w{i} z{i}]= size(im{i});
    if h{i} > mh
        mh = h{i};
    end
    if w{i} > mw
        mw = w{i};
    end
end

for i = 1:length(im)
    diff{i} = [mh mw] - [h{i} w{i}];
    imnew{i} = uint8(zeros(mh,mw,z{i})) + max(im{i}(:));
    hshift = max(ceil(diff{i}(1)/2),1);
    wshift = max(ceil(diff{i}(2)/2),1);
    
    imnew{i}(hshift:hshift+h{i}-1, wshift:wshift+w{i}-1,:) = im{i};
    
    imwrite(imnew{i},['Reference' filesep (i+'A'-1) '.png']);

end

