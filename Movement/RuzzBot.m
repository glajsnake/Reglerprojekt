close all
clear all
COM_CloseNXT all

load startxy;

Prepare
StartPos

negY.WaitFor();

dist = 100;
negY.TachoLimit = dist;
negY.SendToNXT();
negY.WaitFor();


data = negY.ReadFromNXT();
backlashy(abs(data.Position) - dist)
negY.ResetPosition();



% datay = negY.ReadFromNXT();
% by = datay.Position;
% 
% backlashy(dist-by);
% backlashx(0);
% negY.ResetPosition();


