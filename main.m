addpath('Bildanalys\');
addpath('Optimering\');

load alphabet_features.mat;
load dictionary;

%%
%TODO: move to start position
%% prepare camera and make sure the camera is in the right position

prepare_camera;
camera_lineup;

%%
%TODO: press the start button


%% Take a picture of the playing field, analyse and find all possible words
im = acImage(vid);
[letters bonus_tokens] = picture2chars(im, alphabet_features);
[words paths] = find_words(letters, dictionary);


%%
%TODO: take all words