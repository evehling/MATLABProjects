function [mean, sd, med, quart] = cstats(inp)
%CSTATS 
%This function always gives the mean and standard deviation, but can 
%optionally give the median and quartiles if the user inputs the 
%corresponding number of output arguments
%{
Elisabeth Vehling
ITP 168, Spring 2019
Lab 15
vehling@usc.edu
%}
if nargin > 1
    error('Too many input arguments');
end
if isnumeric(inp) == false
    error('Input must be an integer.');
end
if isvector(inp) == false
    error('Input must be numeric vector');  
end
if nargout == 1%calculate mean and stdv, return 2-element vec
    mn = meanFunc(inp);
    sd = standdev(inp);
    mean = [mn, sd];
elseif nargout == 2 %mean and stdv, return two separate variables
    mean = meanFunc(inp);
    sd = standdev(inp);
elseif nargout == 3 %calculate mean, stdv, median
    mean = meanFunc(inp);
    sd = standdev(inp);
    med = median(inp);
elseif nargout == 4 %calculate mean, stdc, med, quart
    mean = meanFunc(inp);
    sd = standdev(inp);
    med = median(inp);
    quart = quartiles(inp);
else %caluclate mean and stdv
    mn = meanFunc(inp);
    sd = standdev(inp);
    mean = [mn, sd]; 
end
end

% Part 1 local functions
function mean = meanFunc(inp) %mean function
    len = length(inp);
    summ = sum(inp);
    mean = summ/len;
end

function std = standdev(inp) %standard deviation function
    if nargin == 1
        corr = 1;
    end
    [row, col] = size(inp);
    if (row == 1 && col == 1)
        std = 0;
    else
        numEl = numel(inp);
        avg = mean(inp);
        numer = sum((inp-avg).^2);
        if (corr == 1)
            std = sqrt(numer/(numEl - 1));
        else
            std = sqrt(numer/numEl);
        end
    end
end

function md = median(inp) %median function
    list = sort(inp);
    len = length(inp);
    if mod(len,2) ==0
        v1 = list((len/2)+1);
        v2 = list((len/2));
        md =(v1+v2)/2;
    else
        md = list(round(len/2));
    end  
end

function qt = quartiles(inp) %quartiles function
    list = sort(inp);
    len = length(inp);
    if mod(len,2) ==0
        v1 = list((len/2)+1);
        v2 = list((len/2));
        md =(v1+v2)/2;
        twf = list((v2)/2);
        svtf = list(v1+(list(len)-v1));
    else
        md = list(round(len/2));
        twf = list(round(md/2));
        svtf = list(md+(list(len)-md)/2);
    end   
    qt = [twf,md,svtf];
end
