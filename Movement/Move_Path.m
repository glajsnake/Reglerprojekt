function Move_Path(motors, path)
%find coordinate
positions = reshape(1:16,[4 4])';

lastdx = 0;
lastdy = 0;
move_distance = 0;
for i = 1:(length(path)-1)
    [sy sx] = find(path(i) == positions);
    [fy fx] = find(path(i+1) == positions);
    
    dx = fx-sx;
    dy = fy-sy;
    
    if dx == lastdx && dy == lastdy
        move_distance = move_distance +1;
    else
        Move(motors,lastdx * move_distance, lastdy * move_distance);
        lastdx = dx;
        lastdy = dy;
        move_distance = 1;
    end
    
    
end
Move(motors,lastdx * move_distance, lastdy * move_distance);