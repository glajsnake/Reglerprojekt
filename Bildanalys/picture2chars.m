function [chars bonus] = picture2chars(im)

screen = extract_screen(im);
letters = extract_letters(screen);

chars = zeros(1,length(letters.bw(:)));
bonus = cell(1,length(letters.bw(:)));


load alphabet_features.mat
for i = 1:length(chars)
    chars(i) = identify_letter(letters.image{i}, alphabet_features);
    bonus{i} = identify_bonus(letters.image{i});
end

chars = char(chars);


end