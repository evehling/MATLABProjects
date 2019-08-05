function sqrtApprox = nsqrt(num, guess, iterate)
%NSQRT: this function uses non-linear systems of equations and  newton's 
%method to solve for the square root of a given value. Takes 3 inputs, a
%number to find square root, an initial guess value, and a number of
%iterations and returns one double.
%{
	Elisabeth Vehling
	ITP 168, Spring 2019
	Lab 23
	vehling@usc.edu 

%}
if nargin < 3%check number of input args
    iterate = 10; %if less than 3, default to 10 iterations
end
if ~isscalar(num) || ~isscalar(guess) || ~isscalar(iterate)%check if input is scalar
	error('Inputs must be scalar.');
end
if ~isnumeric(num) || ~isnumeric(guess) || ~isnumeric(iterate)%check if input is numeric
	error('Inputs must be numeric.');
end
if num < 0 || guess < 0 || iterate < 0 %check if input is positive
	error('Inputs must be positive.');
end
if mod(iterate,1) ~=0%check if the iterations are an integer
	error('Number of iterations must be an integer.');
end
xknot = guess; %set xknot to the initial guess the user input 
for i = 1:iterate %for each iteration
%update the initial value of x knot
fX = xknot*xknot - num; %solve for f(x)
jX = 2*xknot; %solve for j(x)
dX = -fX/jX; %solve for delta x
xknot = xknot + dX; %update xknot with the change (delta x)
end
sqrtApprox = xknot; %return xknot, the approximation
end