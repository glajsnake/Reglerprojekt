tic;

Prepare
StartPos

driveA.TachoLimit = 105;
driveA.SendToNXT();
driveA.WaitFor();
driveA.Stop('off');
driveA.ResetPosition();

%% kör sida till sida

Move(motors, 7, 4)
Move(motors, 3, 4)
Move(motors, 7, 4)
Move(motors, 3, 4)
Move(motors, 7, 4)
Move(motors, 3, 4)
Move(motors, 7, 4)
Move(motors, 3, 4)

%% kör fram och tillbaka

% Move(motors, 1, 4)
% Move(motors, 5, 4)
% Move(motors, 1, 4)
% Move(motors, 5, 4)
% Move(motors, 1, 4)
% Move(motors, 5, 4)
% Move(motors, 1, 4)
% Move(motors, 5, 4)

%% kör en triangel

% Move(motors, 1, 4)
% Move(motors, 7, 4)
% Move(motors, 4, 4)

%% kör en längre random bana

% Push
% Move(motors, 8, 3)
% Lift
% Push
% Move(motors, 3, 2)
% Lift
% Push
% Move(motors, 8, 1)
% Lift
% Push
% Move(motors, 7, 2)
% Lift
% Push
% Move(motors, 5, 4)
% Lift
% StartPos

toc;