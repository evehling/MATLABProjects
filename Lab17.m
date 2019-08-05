%{
Elisabeth Vehling
ITP 168 Spring 2019
Lab 17
vehling@usc.edu
%}
clear; clc; close;
%% Part 1: Read in file
file = dlmread('brainhead.txt');% read in file
%% Part 2: Format the data 
%Male Vectors
male = logical(file(:,1)==1); %create logical array of the male rows
males = file(male,:);%filter out males into new vec using ^^
youngM = logical(males(:,2)==1); %logical array of age 20-46 created using male vec
male2046 = file(youngM,3:4); %filtered vector of men aged 20-46
oldM = logical(males(:,2)==2);%logical array of age 46+ with male vec
male46 = file(oldM,3:4);%filtered vector of men aged 46+

%Female vectors
fem = logical(file(:,1)==2);%logical array of female data rows
fems = file(fem,:);%create new vector of only female rows
youngF = logical(fems(:,2)==1);%create logical array of agew 20-46
fem2046 = fems(youngF,3:4);%create new vector of women aged 20-46
oldF = logical(fems(:,2)==2);%create logical array of ages 46+
fem46 = fems(oldF,3:4);%=create new vector of women aged 46+
%% Part 3: Plot the data
%Note: the x and y names are a little funky, because i was tweaking them
%around to match the reference from the instructions
subplot(2,2,1); %create 2x2 plot grid
% Plot for Males 20-46
yMY = male2046(:,1);%create vec of y vals (head size)
xMY = male2046(:,2);%create vec of x vals (brain mass)
p = polyfit(xMY,yMY,1);%call polyfit between these vectors, (exp 1) for linear
xPlot = linspace(min(xMY),max(xMY),10);%create 10 element vec between min and max of y
yPlot = polyval(p,xPlot);%gnerate x vals
plot(xMY,yMY,'k*',xPlot,yPlot);%plot 
title('Male 20-46');%set title
xlabel('Brain Mass (gram)');
ylabel('Head Size (cm3)');%set labels

% Plots for Males 46+
subplot(2,2,2);%plot this in the second plot
yMO = male46(:,1);%vec of y vals (head size)
xMO = male46(:,2);%vec of x vals (brain mass)
p = polyfit(xMO,yMO,1);%call polyfit
xPlot = linspace(min(xMO),max(xMO),10);%create vec between min and max
yPlot = polyval(p,xPlot);%generate x vals
plot(xMO,yMO,'k*',xPlot,yPlot);%plot
title('Male 46+');%set title and labels
xlabel('Brain Mass (gram)');
ylabel('Head Size (cm3)');

% Plots for Females 20-16
subplot(2,2,3);%plot 3
yFY = fem2046(:,1);%vec of y vals (head size)
xFY = fem2046(:,2);%vec of x vals (brain mass)
p = polyfit(xFY,yFY,1);
xPlot = linspace(min(xFY),max(xFY),10);%vec between min and max
yPlot = polyval(p,xPlot);%generate x vals
plot(xFY,yFY,'k*',xPlot,yPlot);%plot
title('Female 20-46');%set title and labels
xlabel('Brain Mass (gram)');
ylabel('Head Size (cm3)');

% Plots for Females 46+
subplot(2,2,4);%plot 4
yFO = fem46(:,1);%vec of y vals (head size)
xFO = fem46(:,2);%vec of x vals (brain mass)
p = polyfit(xFO,yFO,1);
xPlot = linspace(min(xFO),max(xFO),10);%vec between min and max
yPlot = polyval(p,xPlot);%generate x vals
plot(xFO,yFO,'k*',xPlot,yPlot);%plot
title('Female 46+');%set title and labels
xlabel('Brain Mass (gram)');
ylabel('Head Size (cm3)');

