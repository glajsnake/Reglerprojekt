function chars = picture2chars(im)

screen = extract_screen(im);
letters = extract_letters(screen);

chars = zeros(1,length(letters.bw(:)));

load alphabet_features.mat
for i = 1:length(chars)
    chars(i) = identify_letter(letters.image{i}, alphabet_features);
end




end