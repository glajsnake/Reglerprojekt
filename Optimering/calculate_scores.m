function scores = calculate_scores(words, word_tokens)

scores = zeros(1,length(words));
load letter_scores.mat
for i = 1:length(words)
    score = 0;
    multiplier = 1;
    for j = 1:length(words{i});
        letter_score = letter_scores(words{i}(j) == letter_scores(:,1),2);
        switch word_tokens{i}{j}
            
            case 'n'
                score = score + letter_score;
            case 'dl'
                score = score + letter_score*2;
            case 'tl'
                score = score + letter_score*3;
            case 'dw'
                score = score + letter_score;
                multiplier = multiplier*2;
            case 'tw'
                score = score + letter_score;
                multiplier = multiplier*3;
            otherwise
                throw 'error!'
        end
        
    end
    scores(i) = score*multiplier;

end


end