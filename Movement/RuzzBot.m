tic;

Prepare
StartPos

driveA.TachoLimit = 105;
driveA.SendToNXT();
driveA.WaitFor();
driveA.Stop('off');
driveA.ResetPosition();

%% k�r sida till sida

Move(motors, 7, 4)
Move(motors, 3, 4)
Move(motors, 7, 4)
Move(motors, 3, 4)
Move(motors, 7, 4)
Move(motors, 3, 4)
Move(motors, 7, 4)
Move(motors, 3, 4)

%% k�r fram och tillbaka

% Move(motors, 1, 4)
% Move(motors, 5, 4)
% Move(motors, 1, 4)
% Move(motors, 5, 4)
% Move(motors, 1, 4)
% Move(motors, 5, 4)
% Move(motors, 1, 4)
% Move(motors, 5, 4)

%% k�r en triangel

% Move(motors, 1, 4)
% Move(motors, 7, 4)
% Move(motors, 4, 4)

%% k�r en l�ngre random bana

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