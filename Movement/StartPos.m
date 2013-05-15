%% Activate Switches
OpenSwitch(SENSOR_1);
OpenSwitch(SENSOR_2);
switchState1 = GetSwitch(SENSOR_1);
switchState2 = GetSwitch(SENSOR_2);

%% Run till pushed
while switchState1 == false
    posY.TachoLimit = 0;
    posY.SendToNXT();
    switchState1 = GetSwitch(portA, handle);
end
StopMotor(portA, 'brake');
while switchState2 == false
    posX.TachoLimit = 0;
    posX.SendToNXT();
    switchState2 = GetSwitch(portB, handle);
end
StopMotor(portB, 'brake');

%% Cleanup
CloseSensor(SENSOR_1);
CloseSensor(SENSOR_2);
posY.Stop('off');
posY.ResetPosition();
posX.Stop('off');
posX.ResetPosition();



