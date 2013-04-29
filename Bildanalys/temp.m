
mh = 0;
mw = 0;
for i = 1:26
    im{i} = imread(['output' filesep (i+'A'-1) '.png']);
    [h{i} w{i}]= size(im{i});
    if h{i} > mh
        mh = h{i};
    end
    if w{i} > mw
        mw = w{i};
    end
end

for i = 1:length(im)
    diff{i} = [mh mw] - [h{i} w{i}];
    imnew{i} = zeros(mh,mw,3) + double(max(im{i}(:)));
    hshift = ceil(diff{i}(1)/2);
    wshift = ceil(diff{i}(2)/2);
    
    
end
