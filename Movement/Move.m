function Move (motors, dir, dist)
    horiStandard = 34;
    vertiStandard = 31;
    switch dir %What direction, 1=camerawards 5=entrywards
        case 1 
            motors(1).TachoLimit = vertiStandard*dist;
            motors(1).SendToNXT();
            motors(1).WaitFor();
            motors(1).Stop('off');
            motors(1).ResetPosition();
        case 2            
            motors(3).TachoLimit = vertiStandard*dist;
            motors(1).TachoLimit = horiStandard*dist;
            motors(3).SendToNXT();
            motors(1).SendToNXT();
            motors(3).WaitFor();
            motors(1).WaitFor();
            motors(3).ResetPosition();
            motors(1).ResetPosition();
        case 3
            motors(3).TachoLimit = horiStandard*dist;
            motors(3).SendToNXT();
            motors(3).WaitFor();
            motors(3).Stop('off');
            motors(3).ResetPosition();
        case 4           
            motors(2).TachoLimit = horiStandard*dist;
            motors(3).TachoLimit = vertiStandard*dist;
            motors(2).SendToNXT();
            motors(3).SendToNXT();
            motors(2).WaitFor();
            motors(3).WaitFor();
            motors(2).ResetPosition();
            motors(3).ResetPosition();
        case 5
            motors(2).TachoLimit = vertiStandard*dist;
            motors(2).SendToNXT();
            motors(2).WaitFor();
            motors(2).Stop('off');
            motors(2).ResetPosition();
        case 6            
            motors(2).TachoLimit = vertiStandard*dist;
            motors(4).TachoLimit = horiStandard*dist;
            motors(2).SendToNXT();
            motors(4).SendToNXT();
            motors(2).WaitFor();
            motors(4).WaitFor();
            motors(2).ResetPosition();
            motors(4).ResetPosition();
        case 7
            motors(4).TachoLimit = horiStandard*dist;
            motors(4).SendToNXT();
            motors(4).WaitFor();
            motors(4).Stop('off');
            motors(4).ResetPosition();
        case 8
            motors(4).TachoLimit = vertiStandard*dist;
            motors(1).TachoLimit = horiStandard*dist;
            motors(4).SendToNXT();
            motors(1).SendToNXT();
            motors(4).WaitFor();
            motors(1).WaitFor();
            motors(4).ResetPosition();
            motors(1).ResetPosition();
    end
end