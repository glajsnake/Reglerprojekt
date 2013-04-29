%COMPUTER_LEARNING extracts the features from the letter in the source folder 


source = 'Reference';

path = pwd;
impath = [path filesep source];

alphabet = 'A':'Z';
alphabet_features = zeros(12,length(alphabet));
alphabet_features(1,:) = alphabet;
for i = 1:length(alphabet)
    im = imread([impath filesep (i+'A'-1) '.png']);
    alphabet_features(2:end,i) = segment2features(im);
end

save([path(1:find(path == filesep, 1 , 'last')) 'alphabet_features.mat'],'alphabet_features')