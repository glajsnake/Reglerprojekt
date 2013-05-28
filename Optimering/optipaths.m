function dxdy = optipaths(paths)
%find coordinate
positions = reshape(1:16,[4 4])';

dxdy = cell(size(paths));
for n = 1:length(paths)
    path = paths{n};
    lastdx = 0;
    lastdy = 0;
    move_distance = 0;
    curryx = [];
    for m = 1:(length(path)-1)
        [sy sx] = find(path(m) == positions);
        [fy fx] = find(path(m+1) == positions);
        
        dx = fx-sx;
        dy = fy-sy;
        
        if dx == lastdx && dy == lastdy
            move_distance = move_distance +1;
        else
            curryx(:, end+1) = [lastdx * move_distance
                                lastdy * move_distance];
            lastdx = dx;
            lastdy = dy;
            move_distance = 1;
        end     
    end
    curryx(:, end+1) = [lastdx * move_distance
                        lastdy * move_distance];
    dxdy{n} = curryx(:,2:end);
end
