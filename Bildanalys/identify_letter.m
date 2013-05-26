function character = identify_letter(letter, alphabet_features)
%IDENTIFY_LETTER determines the letter in the image im using the features
%in features.

trimmed_letter = trim_letter(letter);

letter_features = segment2features(trimmed_letter);

deviations = mean((repmat(letter_features,[1 size(alphabet_features,2)]) - alphabet_features(2:end, :)).^2, 1);

character = char(alphabet_features(1, deviations == min(deviations)));