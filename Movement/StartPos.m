%% Activate Switches
OpenSwitch(SENSOR_1);
OpenSwitch(SENSOR_2);
switchState1 = GetSwitch(SENSOR_1);
switchState2 = GetSwitch(SENSOR_2);

%% Run till pushed
posY.TachoLimit = 0;
posY.SendToNXT();
while switchState1 == false
    switchState1 = GetSwitch(portA, handle);
end
StopMotor(portA, 'nobrake');

posX.TachoLimit = 0;
posX.SendToNXT();
while switchState2 == false
    switchState2 = GetSwitch(portB, handle);
end
StopMotor(portB, 'nobrake');

%% Cleanup
CloseSensor(SENSOR_1);
CloseSensor(SENSOR_2);
posY.ResetPosition();
posX.ResetPosition();

backlashy(0);
backlashx(0);



