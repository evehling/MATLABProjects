%computes force of gravity between human and earth
mass1 = 60;
mass2= 5.97219e24;
dist = 6.38e6;
constG = 6.67e-11;
forceG = (constG * mass1 * mass2)/(dist*dist)

%{  %f= fixed point
    %d integer
    %i integer
    %c character
    %s string
    % - left justified display
    % i.e %5.2f == 5 digits, two to the right and adjusts for scientific
    % notation automatically

%}