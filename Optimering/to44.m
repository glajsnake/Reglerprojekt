StartPos

negY.WaitFor();

disty = 90 + backlashy;
%Record med 100;
negY.TachoLimit = disty;
negY.SendToNXT();
negY.WaitFor();
data = negY.ReadFromNXT();
backlashy(abs(data.Position) - disty);
negY.ResetPosition();

distx = 20 + backlashx;
negX.TachoLimit = distx;
negX.SendToNXT();
negX.WaitFor();
data = negX.ReadFromNXT();
backlashx(abs(data.Position) - distx);
negX.ResetPosition();