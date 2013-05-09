function paths = all_paths()

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

    paths = {};
    
    for i = 1:16
        paths = [paths next_depth(i,edof)];
    end
end

function paths = next_depth(current_path, edof)
    letterpositions = next_letters(current_path, edof);
    paths = {};
    for pos = letterpositions
        paths = [paths next_depth([current_path pos],edof)];
    end

end
function letterpositions = next_letters(path, edof)
%the last positions neighbours that is not already in the path
letterpositions = edof(path(end), ~ismember([path(end) edof(path(end), 2:edof(path(end),1)+1)], path));
end