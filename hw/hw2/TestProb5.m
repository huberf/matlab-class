dollars = 5;
cents = 32;
cents = cents + (dollars * 100);
quarters = (cents - mod(cents, 25))/25;
cents = mod(cents, 25);
dimes = (cents - mod(cents, 10))/10;
cents = mod(cents, 10);
nickels = (cents - mod(cents, 5))/5;
cents = mod(cents, 5);
pennies = cents;
fprintf('You have %f quarters, %f dimes, %f nickels, and %f pennies.', ...
    quarters, dimes, nickels, pennies);


% Code to test validity
fprintf('\nThe total number of cents is %f\n', 32 + (dollars * 100));
totalCoins = (quarters * 25) + (dimes * 10) + (nickels * 5) + pennies;
fprintf('The number of output coins is equal to %f.\n', totalCoins);