function transfim = transform(im)


[width height] = size(im);

A = [1 -15/height -0.09/height
     -150/width 1 -0.22/width
     0 0 1];
T = maketform('projective', A);
transfim = imtransform(im, T);
