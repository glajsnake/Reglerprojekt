
function [weighted_scores words paths] = weighted_scores_from_scratch(letters, bonus_tokens,dictionary)
%% Weighted scores from scratch
% returns a sorted vector of the word scores divided by the length of the
% word. Also returns the words and paths.


[words paths] = find_words(letters, dictionary);
tic
word_tokens = build_words_tokens(paths, bonus_tokens);
scores = calculate_scores(words, word_tokens);

weighted_scores = zeros(length(scores),1);

for i = 1:length(scores)
    weighted_scores(i) = scores(i)/length(words{i});
end

[weighted_scores index] = sort(weighted_scores, 'descend');
words = words(index);
paths = paths(index);
toc