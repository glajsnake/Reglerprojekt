%% Clean
COM_CloseNXT all
close all
clear all

%% Import
addpath('Bildanalys\');
addpath('Optimering\');
addpath('Movement\');

load alphabet_features;
load dictionary;

%% Activate NXT and declare motors
Prepare;
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
driveA.TachoLimit = 105;
driveA.SendToNXT();
driveA.WaitFor();
driveA.ResetPosition();

Move_Path(motors, [16 paths{1}(1)]);
for i = 1:length(paths)
    Push;
    Move_Path(motors, paths{i});
    Lift;
    Move_Path(motors, [paths{i}(end) paths{i+1}(1)]); 
end
