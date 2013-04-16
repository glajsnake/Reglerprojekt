%TRIM_ALL_LETTERS trims all the letter images in bokstäver - manuell and puts them in bokstäver - trimmade 

output = 'Bokstäver - trimmade';

path = pwd;
impath = [path(1:find(path == filesep, 1 , 'last')) 'Bokstäver - manuell'];
outputdir = [path(1:find(path == filesep, 1 , 'last')) output];
if ~isdir(outputdir)
    mkdir(outputdir);
end

for currdir = ['A':'Z' 'Å' 'Ä' 'Ö'];
    currdir
    files = dir([impath filesep currdir]);
    for i = 1:length(files)
      
        file = files(i).name;
        if length(file) < 4 || ~strcmp(file(end-3:end), '.png')
            continue;
        end
        im = imread([impath filesep currdir filesep file]);
        trimmed_letter = trim_letter(im);

        if ~isdir([outputdir filesep currdir])
            mkdir([outputdir filesep currdir]);
        end
        imwrite(trimmed_letter, [outputdir filesep currdir filesep file]);
    end
end



