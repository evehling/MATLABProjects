function tumor(n, m)
%TUMOR
%This function takes two input integer values and generates a 3D model for a 
%tumor; the function generates two vectors of spherical coordinates and 
%translates them into cartesian coordinates which are used to plot the
%tumor.
%{
Elisabeth Vehling
ITP 168- Spring 2019
Lab 17
vehling@usc.edu
%}
if nargin ~= 2 %check for correct number of input values
    error('Invalid amount of inputs.');
end
%check to make sure input is numeric, scalar, positive, and an integer
if ~isnumeric(n) || ~isnumeric(m) || ~isscalar(n) || ~isscalar(m) || n <=0 || m <=0 || mod(n,1) ~= 0 || mod(m,1) ~= 0
    error('Input must be positive, numeric, scalar, integer values.');
end
%% Plotting Surfaces
%calculate rho using theta and phi, translate to x,y,z, then plot surface
theta = linspace(0,2*pi);%generate vectors of values for theta and phi using linspace
phi = linspace(0,pi);
[tGrid,pGrid] = meshgrid(theta, phi);%convert vectors to grids using meshgrid
%calculate rho values
%utilize . operator to perform elementwise multiplication on each grid
rho = 1+ (1/5)*sin(m*tGrid).*sin(n*pGrid); 

%convert to cartesian coordinates x,y,and z
%once again using . operators to multiply the corresponding elements of
%each grid
x = rho.*sin(pGrid).*cos(tGrid);
y = rho.*sin(pGrid).*sin(tGrid);
z = rho.*cos(pGrid);

%plot surface of tumor
surf(x,y,z);
end
