 function screen = extract_screen(im);
    tim = transform(im);
    
    screenrect = [190 410 1010 980];
    screen = tim(screenrect(1):screenrect(1)+screenrect(3), ...
        screenrect(2):screenrect(2)+screenrect(4), :);

end