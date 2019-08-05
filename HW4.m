%{
Elisabeth Vehling 
ITP 168 Spring 2019
Homework 4
vehling@usc.edu
%}
clear; clc;
again = true;
while again == true
    %% Part 1: Ask for Input
    numPrimes = input('How many prime numbers do you want: ');
    while mod(numPrimes, 1)~=0 || numPrimes <= 0 %check to make sure input is int and non neg
        fprintf('Invalid! Must be a positive integer value!\n');
        numPrimes = input('How many prime numbers do you want: ');
    end
    %% Part 2: Pre-Allocated
    primeVec = zeros(1,numPrimes); %create empty array of user-specified length
    primeVec(1) = 2; %initialize first index pos to 2
    %% Part 3: Finding a Prime
    index = 2;%index position of primeVec
    int = 3; %integer to be checked, starting with 3
    while index <= numPrimes %while the vector still needs to be filled in
        b = mod(int, primeVec);%mod int with each element of primeVec
        if prod(b) ~=0 %multiply b; if number is not prime, b will = 0 bc 0 * everything else =0
            primeVec(index) = int; %set current index to the integer
            index = index + 1; %increment index position
        end
        int = int + 2;  %increase integer by 2: even numbers (aside from 2) won't be prime, so no need to check
    end
    %% Part 4: Printing the Primes
    number = 1; %display number
    for p = 1:numPrimes %for each element in the vector
        fprintf('%0.0f. %0.0f\n',number,primeVec(p)); %print
        number = number +1; %increment display
    end
    %% Part 5: Repeat
    contLoop = input('Would you like to do it again? (Y/N):', 's');
    if upper(contLoop) == 'N' %convert to uppercase to make it easier for user
        again = false; %if no, end loop
    elseif upper(contLoop) == 'Y'
        fprintf('Running again...\n');% continue program
    else
        fprintf('Incorrect input! Running again...\n'); %error, and run again
    end   
end %end program loop
