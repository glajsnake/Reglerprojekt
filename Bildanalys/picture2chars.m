function [chars bonus] = picture2chars(im, alphabet_features)
tic
screen = extract_screen(im);
letters = extract_letters(screen);

chars = zeros(1,length(letters));
bonus = cell(1,length(letters));


for i = 1:length(chars)
    chars(i) = identify_letter(letters{i}, alphabet_features);
    bonus{i} = identify_bonus(letters{i});
end

chars = char(chars);

toc
end