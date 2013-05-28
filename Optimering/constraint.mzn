include "cumulative.mzn";
include "maximum.mzn";

int n = 5;
set of int: nwords = 1..n;

%just for us so we kremember
array[nwords] of string: words = ["HWM", "DRIVE", "HD", "STEER", "HSM"];


array[nwords] of int: costTime = [3,5,2,5,3];
array[nwords] of int: scores = [10, 7 , 2, 5, 6];

array[nwords] of int: startx = [1, 2 , 1, 4, 2];
array[nwords] of int: starty = [1, 3 , 1, 4, 4];
array[nwords] of int: endx = [1, 4 , 1, 3, 4];
array[nwords] of int: endy = [3, 3 , 2, 1, 2];


array[nwords] of var 0..n: positions; %will become a index list (words = words(order); in matlab)

array[nwords] of var 1..4: dx;
array[nwords] of var 1..4: dy;

array[nwords] of var 1..4: distance;

constraint forall([startTime[i]+duration[i] = endTime[i] | i in nwords]);

int: battery = 100;
int: cpu40 = 25;
int: cpu60 = 31;
int: cpu80 = 37;
int: limit40 = 149+battery-cpu40;
int: limit60 = 120+battery-cpu60;
int: limit80 = 90+battery-cpu80;


constraint cumulative(startTime, duration, r40, limit40);
%constraint cumulative(startTime, duration, r60, limit60);
%constraint cumulative(startTime, duration, r80, limit80);

constraint forall(i in 1..3, j in 4..5)(endTime[i] <= startTime[j]);
constraint forall(i in 1..3, j in 4..5)(startTime[j] <= endTime[i] + 45);

constraint forall(i in 10..11, j in 8..9)(endTime[i] <= startTime[j]);
constraint forall(i in 10..11, j in 8..9)(startTime[j] <= endTime[i] + 45);

constraint endTime[6] <= startTime[8];
constraint endTime[7] <= startTime[9];
constraint endTime[8] <= startTime[4];
constraint endTime[9] <= startTime[5];
constraint endTime[4] <= startTime[5];

var 1..100: maxTime;
constraint maximum(maxTime, endTime);


solve minimize maxTime; 

output [show(names), "\n", show(startTime), "\n", "End Time: ", show(maxTime)];



