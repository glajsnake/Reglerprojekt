function [chars bonus] = picture2chars(im, alphabet_features)


disp('    Extracting screen\n');
screen = extract_screen(im);

disp('    Extracting letter images\n');
letters = extract_letters(screen);
chars = zeros(1,length(letters));
bonus = cell(1,length(letters));

disp('    Identifying letters\n');
for i = 1:length(chars)
    chars(i) = identify_letter(letters{i}, alphabet_features);
    bonus{i} = identify_bonus(letters{i});
end

chars = char(chars);
toc; disp('\n');
end