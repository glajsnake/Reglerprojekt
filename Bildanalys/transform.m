function transfim = transform(im);

[width height] = size(im);

A = [1 -15/height 0.02/height
     115/width 1 0.3/width
     0 0 1];
T = maketform('projective', A);
transfim = imtransform(im, T);

