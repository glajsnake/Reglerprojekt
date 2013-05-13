%BUILD_PATHS generate a Ruzzle path
%
% [path] = build_paths(start, finish) generates a path from start to
% finish. Both must be integer values between 1 and 16, meaning a position
% from right to left, top to bottom on the ruzzle board.
[path] = build_paths(from, to)

distance = to-from;

while true
    path = [from];
    if distance <= -5
        path(end +1) = path(end) -5;
        distance = distance-5;
    elseif distance <=  
        
    end
end

%%TODO: decide if this is not needed