driveB.Stop('off');
data = driveB.ReadFromNXT();
pos  = data.Position
driveB.TachoLimit = pos + 150;
driveB.SendToNXT();
driveB.WaitFor();
driveB.Stop('off');
revB.TachoLimit = pos + 150;
revB.SendToNXT();
revB.WaitFor();
revB.Stop('off');
driveB.Stop('off');
driveB.ResetPosition();
revB.Stop('off');
revB.ResetPosition();