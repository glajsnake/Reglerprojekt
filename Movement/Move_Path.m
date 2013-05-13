%MOVE_TOFROM moves the pen from start to finish
% intended use is for moving the pen between words
function Move_Path(motors, path)
%find coordinate
positions = reshape(1:16,[4 4])';

for i = 1:(length(path)-1)
    [sx sy] = find(path(i) == positions);
    [fx fy] = find(path(i+1) == positions);
    
    dx = fx-sx;
    dy = fy-sy;
    
    
    Move(motors,dx,dy);
end