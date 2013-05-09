function transfim = transform(im);

[width height] = size(im);

A = [1 -15/height 0.14/height
     610/width 1 0.8/width
     0 0 1];
T = maketform('projective', A);
transfim = imtransform(im, T);

transfim = flipdim(transfim,1);
transfim = flipdim(transfim,2);