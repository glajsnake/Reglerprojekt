close all
clear all
COM_CloseNXT all

load startxy;

Prepare
StartPos

negY.TachoLimit = 95;
negY.SendToNXT();
negY.WaitFor();
negY.ResetPosition();

posY.TachoLimit = 15;
posY.SendToNXT();
posY.WaitFor();
posY.ResetPosition;




