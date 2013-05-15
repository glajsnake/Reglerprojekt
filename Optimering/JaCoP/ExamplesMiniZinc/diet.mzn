% John has strange eating habits; he eats items containing chocolate, sugar and fat. 
% Assume that we have the following table of items.
%
%                  calories  chocolate  sugar  fat  cost
% 1. brownie        400        3         2      2    50
% 2. ice_cream      200        2         2      4    20
% 3. coke           150        0         4      1    30
% 4. cheesecake     500        0         4      5    80
%
% Each day John must ingest at least 500 calories, 6 units of chocolate,
% 10 units of sugar and 8 units of fat. Compose Johns intake of food 
% while satisfying the constraints and minimizing the cost.
%
% Model created by Krzysztof Kuchcinski

include "knapsack.mzn";

int: n = 4;
int: Max = 10;

array[1..n] of var 0..Max: items;

array[1..n] of int: calories = [400, 200, 150, 500];
array[1..2] of int: chocolate = [3, 2]; %, 0, 0]; % zeros are not accepted by knapsack constraint
array[1..n] of int: sugar = [2, 2, 4, 4];
array[1..n] of int: fat = [2, 4, 1, 5];
array[1..n] of int: cost = [50, 20, 30, 80];

var 500..1000: intake_calories;
var   6..1000: intake_chocolate;
var  10..1000: intake_sugar;
var   8..1000: intake_fat;

var 0..100: price;
var 0..100: price_part;

constraint
   knapsack(n, calories,  cost, intake_calories,  price, items) /\

%  knapsack constraint below cannot be used since knapsack constraint does not allow 0 weights
   knapsack(2, chocolate, [cost[i] | i in 1..2], intake_chocolate, price_part, [items[i] | i in 1..2]) /\
   price = price_part + sum(i in 3..4) (items[i]*cost[i]) /\

   knapsack(n, sugar,     cost, intake_sugar,     price, items) /\
   knapsack(n, fat,       cost, intake_fat,       price, items)
;

solve minimize price;

output[show(price), show(items)];