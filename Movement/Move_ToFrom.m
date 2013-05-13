%MOVE_TOFROM moves the pen from start to finish
% intended use is for moving the pen between words
function Move_ToFrom(start, finish)
%find coordinate
positions = reshape(1:16,[4 4])';
[sx sy] = find(start == positions);
[fx fy] = find(finish == positions);

dx = fx-sx;
dy = fy-sy;


