function Move (motors, dx, dy)
persistent lastx;
persistent lasty;


horiStandard = 48;
vertiStandard = 40;
RunX = 0;
RunY = 0;
doX = 1;
doY = 1;


if dx>0       
    distx = horiStandard*dx-backlashx;
    if lastx < 0
        distx = distx + 0;
    end
    lastx = 1;
    
    motors(3).TachoLimit = distx;
    RunX = 3;
    
elseif dx<0
    distx = horiStandard*(-dx)+backlashx;
    if lastx > 0
        distx = distx + 0;
    end
    lastx = -1;
    
    motors(4).TachoLimit = distx;
    RunX = 4;
else
    doX = 0;
end

if dy>0
    disty = vertiStandard*dy-backlashy;
    if lasty < 0
        disty = disty + 7;
    end
    lasty = 1;
    motors(2).TachoLimit = disty;
    RunY = 2;
elseif dy<0
    disty = vertiStandard*(-dy)+backlashy;
    if lasty > 0
        disty = disty + 7;
    end
    lasty = -1;
    motors(1).TachoLimit = disty;
    RunY = 1;
else
    doY = 0;
end

if doX == 1
    motors(RunX).SendToNXT();
end
if doY == 1
    motors(RunY).SendToNXT();
end
if doX == 1
    motors(RunX).WaitFor();
    data = motors(RunX).ReadFromNXT();
    backlashx(abs(data.Position) - distx);
end
if doY == 1
    motors(RunY).WaitFor();
    data = motors(RunY).ReadFromNXT();
    backlashy(abs(data.Position) - disty);
end


if doX == 1
    motors(3).ResetPosition();
    motors(4).ResetPosition();
end
if doY == 1
    motors(1).ResetPosition();
    motors(2).ResetPosition();
end
