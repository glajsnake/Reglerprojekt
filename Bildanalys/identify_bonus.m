function bonus = identify_bonus(letter);
load 'bonus_features and bonus_names.mat';

letter_bonus_features(1:3,1) = double(letter(1,1,:));

deviations = mean((repmat(letter_bonus_features,[1 size(bonus_features,2)]) - bonus_features).^2, 1);

bonus = bonus_names{deviations == min(deviations)};