letters = extract_letters(extract_screen(imread('myfirstimage.jpg')));


for i = 1:4
    for j = 1:4
        trimmed = trim_letter(letters.bw{i,j});
        letter = identify_letter(trimmed,alphabet_features);
        imagesc(trimmed);
        pause
    end
end