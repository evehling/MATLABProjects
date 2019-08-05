function solution = usolve(coeffM, constV)
%USOLVE: this function solves a system of equations only if it can find a
%unique solution to the system. If it finds infinite or no solutions, it
%will return a warning. It takes a matrix of coefficients and a vector of
%constants as input
%{
	Elisabeth Vehling
	ITP 168, Spring 2019
	Lab 22
	vehling@usc.edu
%}
%% Part 1: Validate Input
if ~isnumeric(constV) || ~isnumeric(coeffM)%check if input is numeric
	error('Inputs must be numeric.');
end
if ~ismatrix(coeffM)%check if coeff are in matrix
	error('One input must be a matrix.');
end
if ~iscolumn(constV)%check if the vec is a column vec
	error('One input must be a column vector');
end

[r1, c1] = size(constV); %get size of rows and columns of each input
[r2, c2] = size(coeffM);
if r1 ~= r2 %if the rows don't match, throw error
	error('Rows must have same dimensions.');
end
%% Part 2: Existence of Solution
augMat = [coeffM constV]; %create matrix holding matrix and vec
redAugMat = rref(augMat); %find the reduced row eschelon form of this new vec

if rank(coeffM) ~= rank(augMat) %if ranks don't match, throw error
	warning('No solution exists');
    solution = []; %return empty array
%if ranks are the same and the rank is equal to the number of columns
%there is exactly ONE solution
%% Part 3: Number of Solutions
elseif rank(coeffM) == rank(augMat) && rank(coeffM) == c2
    newA = redAugMat(:,1:c2); %solve for system
    newB = redAugMat(:,c2+1);
    X = newB;
    solution = X;%return solution
else
	warning('Infinite solutions exist'); %return warning and empty array
    solution = [];
end
end