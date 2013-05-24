%% Clean
close all
clear all

%% Import
addpath('Bildanalys\');
addpath('Optimering\');
addpath('Movement\');
addpath('RWTHMindstormsNXT\');
addpath('RWTHMindstormsNXT\tools\');
addpath('libusb-win32-bin-1.2.6.0\');

COM_CloseNXT all

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
maintic = tic;

disp('Taking picture');
im = acImage(vid); toc(maintic);
[letters bonus_tokens] = picture2chars(im, alphabet_features)
[scores words paths] = scores_from_scratch(letters, bonus_tokens);
[scores index] = sort(scores, 'descend');
paths = paths(index);
words = words(index);

%%
%TODO: take all words
dist = 100;
negY.TachoLimit = dist;
negY.SendToNXT();
negY.WaitFor();
data = negY.ReadFromNXT();
backlashy(abs(data.Position) - dist)
negY.ResetPosition();


Move_Path(motors, [16 paths{1}(1)]);
for i = 1:length(paths)
    if toc(maintoc) > 20
        break;
    end
    Push;
    Move_Path(motors, paths{i});
    Lift;
    Move_Path(motors, [paths{i}(end) paths{i+1}(1)]); 
end
