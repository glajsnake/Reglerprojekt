%% Build word tokens
% Takes a list of paths and the pathnumbers respective bonus tokens and
% returns a cell array of cell arrays containing the bonus tokens for every
% position of every word.
function word_tokens = build_word_tokens(paths, letter_tokens)
word_tokens = cell(length(paths),1);

for i = 1:length(paths)
    word_tokens{i} = cell( 1, length(paths{i}) );
    for j = 1:length(paths{i})
        word_tokens{i}{j} = letter_tokens{paths{i}(j)};
    end
end