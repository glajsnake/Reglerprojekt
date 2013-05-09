function [words paths] = find_words(letters,dict)


edof = [3  2  5  6  0  0  0  0  0
        5  1  3  5  6  7  0  0  0
        5  2  4  6  7  8  0  0  0
        3  3  7  8  0  0  0  0  0
        5  1  2  6  9  10 0  0  0
        8  1  2  3  5  7  9  10 11
        8  2  3  4  6  8  10 11 12
        5  3  4  7  11 12 0  0  0
        5  5  6  10 13 14 0  0  0
        8  5  6  7  9  11 13 14 15
        8  6  7  8  10 12 14 15 16
        5  7  8  11 15 16 0  0  0
        3  9  10 14 0  0  0  0  0
        5  9  10 11 13 15 0  0  0
        5  10 11 12 14 16 0  0  0
        3  11 12 15 0  0  0  0  0];


tic
words = {};
paths = {};
for i = 1:length(letters)
    [new_words new_paths] = next_depth(letters(i),i, letters, next_letters(edof,i), dict, edof);
    words = [words new_words];
    paths = [paths new_paths];
end
toc
 s=cellfun(@size,words,'uniform',false);
[trash is]=sortrows(cat(1,s{:}),-[1 2]);
words = words(is);
paths = paths(is);

end


function [newords newpaths] = next_depth(word, path, letters, possiblepositions, dict, edof)
newords = {};
newpaths = {};
for i = 1:length(possiblepositions) %check possible continuations
    neword = [word letters(possiblepositions(i))]; %add letter
    newpath = [path possiblepositions(i)];
    found_words = find(strncmp(neword, dict, length(neword))); %look for match
    if ~isempty(found_words) & find(strcmp(dict(found_words(1)), neword))
        newords{end+1} = neword; %add word
        newpaths{end+1} = newpath; %add path
        if length(found_words) > 1 %if more words starting with this word. ex: "BOOK" and "BOOKS"
            next_possiblepositions = next_letters(edof,newpath); %check for possible path
            [next_words next_paths] = next_depth(neword, newpath, letters, next_possiblepositions, dict(found_words), edof);%test next
            newords = [newords next_words]; 
            newpaths = [newpaths next_paths];
        end
        
    elseif ~isempty(found_words) %if this is not a word but the start is good. ex: "SWOR"
            next_possiblepositions = next_letters(edof,newpath); %check for possible path
            [next_words next_paths] = next_depth(neword, newpath, letters, next_possiblepositions, dict(found_words), edof);%test next
            newords = [newords next_words]; 
            newpaths = [newpaths next_paths];
    end
end

end

function letterpositions = next_letters(edof, path)
%the last positions neighbours that is not already in the path
letterpositions = edof(path(end), ~ismember([path(end) edof(path(end), 2:edof(path(end),1)+1)], path));
end
