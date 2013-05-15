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
negY    = NXTMotor(portA, 'Power',  power, 'ActionAtTachoLimit', 'HoldBrake');
posY  = NXTMotor(portA, 'Power', -power, 'ActionAtTachoLimit', 'HoldBrake');
posX    = NXTMotor(portB, 'Power',  power, 'ActionAtTachoLimit', 'HoldBrake');
negX  = NXTMotor(portB, 'Power', -power, 'ActionAtTachoLimit', 'HoldBrake');
driveC = NXTMotor(portC, 'Power', power, 'ActionAtTachoLimit', 'HoldBrake');
revC = NXTMotor(portC, 'Power', -power, 'ActionAtTachoLimit', 'HoldBrake');
motors = [negY, posY, posX, negX, driveC, revC];


%% Prepare motors
for i=1:6
    motors(i).Stop('off');
    motors(i).ResetPosition();
end
