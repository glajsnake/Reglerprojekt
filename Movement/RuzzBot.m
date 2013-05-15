close all
clear all
COM_CloseNXT all

Prepare
StartPos

negY.TachoLimit = 95;
negY.SendToNXT();
negY.WaitFor();
negY.ResetPosition();

Move(motors, -2, 0)
Move(motors, 0, -2)
Move(motors, 2, 0)
Move(motors, 0, 2)
