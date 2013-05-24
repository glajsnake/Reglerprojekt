%% Connect to NXT, via USB or BT
handle = COM_OpenNXT();
COM_SetDefaultNXT(handle);

%% Set params
power = 50;
portA = MOTOR_A;
portB = MOTOR_B;
portC = MOTOR_C;

%% Create motor objects
% we use holdbrake, make sense for robotics
negY    = NXTMotor(portA, 'Power',  power, 'ActionAtTachoLimit', 'Brake');
posY  = NXTMotor(portA, 'Power', -power, 'ActionAtTachoLimit', 'Brake');
posX    = NXTMotor(portB, 'Power',  power, 'ActionAtTachoLimit', 'Brake');
negX  = NXTMotor(portB, 'Power', -power, 'ActionAtTachoLimit', 'Brake');
driveC = NXTMotor(portC, 'Power', power, 'ActionAtTachoLimit', 'Brake');
revC = NXTMotor(portC, 'Power', -power, 'ActionAtTachoLimit', 'Brake');
motors = [negY, posY, posX, negX, driveC, revC];


%% Prepare motors
for i=1:6
    motors(i).ResetPosition();
end
