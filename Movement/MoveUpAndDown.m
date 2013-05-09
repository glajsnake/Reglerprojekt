%% Prepare
COM_CloseNXT all
close all
clear all

%% Connect to NXT, via USB or BT
handle = COM_OpenNXT();
COM_SetDefaultNXT(handle);

%% Set params
power = 100;
port  = MOTOR_A;
dist  = 180;    % distance to move in degrees

%% Create motor objects
% we use holdbrake, make sense for robotic arms
mUp    = NXTMotor(port, 'Power',  power, 'ActionAtTachoLimit', 'HoldBrake');
mDown  = NXTMotor(port, 'Power', -power, 'ActionAtTachoLimit', 'HoldBrake');

%% Prepare motor
mUp.Stop('off');
mUp.ResetPosition();

%%Repeat 2 times
for j=1:1
    
    % where are we?
    data = mUp.ReadFromNXT();
    pos  = data.Position;
    
    % where do we want to go?
    % account for errors, i.e. if pos is not 0
    mDown.TachoLimit = dist + pos;
    
    % move
    mDown.SendToNXT();
    mDown.WaitFor();
    
    % now we are at the bottom, repeat the game:
    % where are we?
    data = mUp.ReadFromNXT(); % doesn't matter which object we use to read!
    pos  = data.Position;
    
    % pos SHOULD be = dist in an ideal world
    % but calculate new "real" distance to move
    % based on current error...    
    % but avoid negative values!
    mUp.TachoLimit = abs(pos);
    % this looks very simple now, but it comes from
    %   TachoLimit = dist + (pos - dist);
    % i.e. real distance + error correction
    % Imagine it this way: We are currently at pos,
    % and want to go back to 0, so this is exactly the distance
    % to go! And then only take abs, because power takes care of the sign
    
    mUp.SendToNXT();
    mUp.WaitFor();
    
end