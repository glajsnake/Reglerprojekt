

fid = fopen('Words.txt');
file = fread(fid);
wordcount = 1;
lettercount = 1;
dictionary = cell(1000000,1);
for i = 1:length(file)
    current_letter = file(i);
    if current_letter == 13
        if lettercount ~= 1
            wordcount = wordcount+1;
        end
        lettercount = 1;
        continue
    elseif current_letter == 10
        continue
    end
    dictionary{wordcount}(lettercount) = char(current_letter);
    lettercount = lettercount+1;
end
dictionary = unique(sort(dictionary));
fclose(fid);

