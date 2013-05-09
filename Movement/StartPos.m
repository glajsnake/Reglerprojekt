%% Activate Switches
OpenSwitch(SENSOR_1);
OpenSwitch(SENSOR_2);
switchState1 = GetSwitch(SENSOR_1);
switchState2 = GetSwitch(SENSOR_2);

%% Run 'till pushed
while switchState1 == false
    revA.TachoLimit = 0;
    revA.SendToNXT();
    switchState1 = GetSwitch(portA, handle);
end
StopMotor(portA, 'brake');
while switchState2 == false
    driveB.TachoLimit = 0;
    driveB.SendToNXT();
    switchState2 = GetSwitch(portB, handle);
end
StopMotor(portB, 'brake');

%% Cleanup
CloseSensor(SENSOR_1);
CloseSensor(SENSOR_2);
revA.Stop('off');
revA.ResetPosition();
driveB.Stop('off');
driveB.ResetPosition();



