%% Clean

try
    COM_CloseNXT(handle);
end
close all
clear all

%% Import


addpath('Bildanalys\');
addpath('Optimering\');
addpath('Movement\');
addpath('RWTHMindstormsNXT\');
addpath('RWTHMindstormsNXT\tools\');
addpath('libusb-win32-bin-1.2.6.0\');

COM_CloseNXT('all')

load alphabet_features;
tic;
load dictionary;
toc;

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
fprintf('Taking picture...');
im = acImage(vid);
disp('Done');



disp('Image analysis');
fprintf('    Extracting screen...');
screen = extract_screen(im);
disp('Done');

%-------picture2chars-----------------------------------------------

fprintf('    Extracting letter images...');
letters = extract_letters(screen);
chars = zeros(1,length(letters));
bonus = cell(1,length(letters));
disp('Done');
fprintf('    Identifying letters...');
for i = 1:length(chars)
    chars(i) = identify_letter(letters{i}, alphabet_features);
    bonus{i} = identify_bonus(letters{i});
end
disp('Done');

chars = char(chars);
disp(reshape(bonus,[4 4])');
disp(reshape(chars,[4 4])');
toc(maintic); 
%--------------------------------------------------------------------

%%

[scores words paths] = weighted_scores_from_scratch(char(chars), bonus, dictionary);
[scores index] = sort(scores, 'descend');
paths = paths(index);
words = words(index);

[uwords uindex]= unique(words,'first');
upaths = paths(uindex);
uscores = scores(uindex);

[scores index] = sort(uscores, 'descend');
paths = upaths(index);
words = uwords(index);
toc(maintic)

%% take all words
to44;

Move_Path(motors, [16 paths{1}(1)]);
for i = 1:length(paths)
    if toc(maintic) > 60 && ~halfwayreset
        %to44;
        %Move_Path(motors, [16 paths{i}(1)]);
        %halfwayreset = 1;
    end
    if toc(maintic) > 120 %120
        break;
    end
    Push;
    Move_Path(motors, paths{i});
    Lift;
    Move_Path(motors, [paths{i}(end) paths{i+1}(1)]); 
end
