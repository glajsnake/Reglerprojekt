%% Prepare
COM_CloseNXT all
close all
clear all

%% Connect to NXT, via USB or BT
handle = COM_OpenNXT();
COM_SetDefaultNXT(handle);

%% Set params
power = 100;
portA = MOTOR_A;
portB = MOTOR_B;
portC = MOTOR_C;

%% Create motor objects
% we use holdbrake, make sense for robotics
driveA    = NXTMotor(portA, 'Power',  power, 'ActionAtTachoLimit', 'HoldBrake');
revA  = NXTMotor(portA, 'Power', -power, 'ActionAtTachoLimit', 'HoldBrake');
driveB    = NXTMotor(portB, 'Power',  power, 'ActionAtTachoLimit', 'HoldBrake');
revB  = NXTMotor(portB, 'Power', -power, 'ActionAtTachoLimit', 'HoldBrake');
driveC = NXTMotor(portC, 'Power', power, 'ActionAtTachoLimit', 'HoldBrake');
revC = NXTMotor(portC, 'Power', -power, 'ActionAtTachoLimit', 'HoldBrake');
motors = [driveA, revA, driveB, revB, driveC, revC];


%% Prepare motors
driveA.Stop('off');
driveA.ResetPosition();
revA.Stop('off');
revA.ResetPosition();
driveB.Stop('off');
driveB.ResetPosition();
revB.Stop('off');
revB.ResetPosition();
driveC.Stop('off');
driveC.ResetPosition();
revC.Stop('off');
revC.ResetPosition();

