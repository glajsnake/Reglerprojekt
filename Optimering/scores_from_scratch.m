function [scores words paths] = scores_from_scratch(letters, bonus_tokens, dictionary)
%% Scores from scratch
% returns a sorted vector of the word scores.

[words paths] = find_words(letters, dictionary);
tic
word_tokens = build_words_tokens(paths, bonus_tokens);
scores = calculate_scores(words, word_tokens);
