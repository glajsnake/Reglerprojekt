

fid = fopen('words.txt');
file = fread(fid);
wordcount = 1;
lettercount = 1;
dictionary = cell(172819,1); %number of words (easier with fewer, but takes longer time)
for i = 1:length(file)
    current_letter = file(i);
    if current_letter == 10
        if lettercount ~= 1
            wordcount = wordcount+1;
        end
        lettercount = 1;
        continue
    end
    dictionary{wordcount}(lettercount) = char(current_letter);
    lettercount = lettercount+1;
end
dictionary = unique(sort(dictionary));
fclose(fid);

