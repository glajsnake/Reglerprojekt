function Move (motors, dir, dist)
    switch dir %What direction, 1=camerawards 5=entrywards
        case 1 
            motors(1).TachoLimit = 40*dist;
            motors(1).SendToNXT();
            motors(1).WaitFor();
            motors(1).Stop('off');
            motors(1).ResetPosition();
        case 2
            
        case 3
            motors(3).TachoLimit = 35*dist;
            motors(3).SendToNXT();
            motors(3).WaitFor();
            motors(3).Stop('off');
            motors(3).ResetPosition();
        case 4
            
        case 5
            motors(2).TachoLimit = 40*dist;
            motors(2).SendToNXT();
            motors(2).WaitFor();
            motors(2).Stop('off');
            motors(2).ResetPosition();
        case 6
            
        case 7
            motors(4).TachoLimit = 35*dist;
            motors(4).SendToNXT();
            motors(4).WaitFor();
            motors(4).Stop('off');
            motors(4).ResetPosition();
        case 8
            
    end
end