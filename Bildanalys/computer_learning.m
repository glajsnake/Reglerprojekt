%COMPUTER_LEARNING extracts the features from the letter in the source folder 


source = 'Reference';

path = pwd;
impath = [path(1:find(path == filesep, 1 , 'last')) source];

alphabet = 'A':'Z';
alphabet_features = zeros(12,length(alphabet));
alphabet_features(1,:) = alphabet;
for currletter = 1:length(alphabet_features)
    currdir = alphabet(1,currletter);
    files = dir([impath filesep currdir]); 
    
    for i = 1:length(files)
      
        file = files(i).name;
        if length(file) < 4 || ~strcmp(file(end-3:end), '.png')
            continue;
        end
        im = imread([impath filesep currdir filesep file]);
        letterfeatures(:,i) = segment2features(im);
        
    end
    alphabet_features(2:end,currletter) = mean(letterfeatures,2);
end

save([path(1:find(path == filesep, 1 , 'last')) 'alphabet_features.mat'],'alphabet_features')