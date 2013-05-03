function screen = extract_screen(im);
    load screenrect;
    tim = transform(im);
    
    screen = tim(screenrect(1):screenrect(1)+screenrect(3), ...
        screenrect(2):screenrect(2)+screenrect(4), :);

end