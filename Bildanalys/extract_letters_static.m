function letters = extract_letters_static(image, rect)
%EXTRACT_LETTERS_STATIC
%im is a image containing the playing field and rect is a rectangle
%specifying where the playing field is [xstart ystart width height]

field = image(rect(1):rect(1)+rect(3), rect(2):rect(2)+rect(4));
