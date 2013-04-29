%TRIM_ALL_LETTERS trims all the letter images in bokstäver - manuell and puts them in bokstäver - trimmade 

output = 'output';

path = pwd;
impath = [path filesep 'Reference'];
outputdir = [path filesep output];
if ~isdir(outputdir)
    mkdir(outputdir);
end

files = dir(impath);
for i = 1:length(files)
    
    file = files(i).name;
    if length(file) < 4 || ~strcmp(file(end-3:end), '.png')
        continue;
    end
    im = imread([impath filesep file]);
    trimmed_letter = trim_letter(im);
    
    if ~isdir([outputdir])
        mkdir([outputdir]);
    end
    imwrite(trimmed_letter, [outputdir filesep file]);
end




