addpath('Bildanalys\');
addpath('Optimering\');
addpath('Movement\');

load alphabet_features.mat;
load dictionary;

%% move the phone to the start position
StartPos;
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
Move_Path([16 paths{1}(1)]);
for i = 1:length(paths)
    Move_Path(paths{i});
    Move_Path([paths{i}(end) paths{i+1}(1)]); 
end