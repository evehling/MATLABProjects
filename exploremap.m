function exploremap(long,lat,elev)
%EXPLOREMAP Creates an interactive map to explore
% This function will take in the data given by the three arrays, X, Y, and
% Z. They must all be arrays of the same dimensions. It will then plot the
% contour map and a surface map and will allow the user to move about the
% contour map using the WASD keys. The user will quit using the Q key. The
% boundary box should not extend beyond the map edges
%{
Elisabeth Vehling
ITP 168 Spring 2019
Homework 9
vehling@usc.edu
%}
%% TODO: WRITE CODE HERE:
%% Part 2: Exploremap Setup
%validate input
if ~isnumeric(long) || ~isnumeric(lat) || ~isnumeric(elev)%check if inpus is numeric
    error('Inputs must be numeric');
end
[r3,c3] = size(elev); %get size of elevation vector
[r2,c2] = size(long);%get size of longitude vector
[r,c] = size(lat);%get size of latitude vector
if (r2~=r) || (r2~=r3) || (r3~=r)||(c3~=c2)|| (c2~=c)||(c~=c3)%check if the dimensions are equal to eachother
    error('Input arrays must be the same size');
end
longConv = zeros(size(lat));%create two empty vectors to hold converted lat/long values
latConv = zeros(size(lat));%

%Longitude
for i=2:1:c2 %for each element in the vector, convert to meters
    longConv(:,i) = longConv(:,i-1)+ 6371000 * tand(long(:,i)-long(:,i-1));
end
%Latitude
for i=2:1:r %convert to meters
    latConv(i,:) = latConv(i-1,:)+ 6371000 * tand(lat(i,:)-long(i-1,:));
end

%% Part 3: exploremap Plot
[maxR, maxC] = size(long); %get perimeter

ymin = max(longConv);%get min of the longitude
longMax = max(longConv); %get max longitude
xmin = min(latConv);%get minimum latitude
xMax = max(max(latConv));%get max latitude

subplot(1,2,1);%plot surface graph
surf(latConv,longConv,elev);
subplot(1,2,2);
contour(longConv, latConv, elev);%plot contour plot
%xlim(sort(longConv));
%ylim(sort(latConv));
hold on
%% Part 4: Plotting the Boundary Box
boxSz = 30; %box size
uSz = latConv(5); %move up/down size
lSz = longConv(5); %move l/r size

x1 = longConv(1,1); %convert box corners into meter coords
y1 = latConv(1,1);
x2 = longConv(1,30);
y2 = latConv(1,30);
x3 = longConv(30,30);
y3 = latConv(30,30);
x4 = longConv(30,1);
y4 = latConv(30,1);
x5 = longConv(1,1);
y5 = latConv(1,1);
%one for each xy, x = long, y=lat
xVec = [x1 x2 x3 x4 x5];%create two vectors using these points
yVec = [y1 y2 y3 y4 y5];
box = plot(xVec, yVec, 'r');
%% don't touch this stuff
set(gcf,'KeyPressFcn',@callback);
set(gcf,'CurrentCharacter','n');
choose = 'n';
while (choose ~= 'q')
    choose = get(gcf,'CurrentCharacter');
    switch choose
        case 's' %the user wants to move south
            %% TODO: WRITE CODE HERE
            if yVec(4) > longMax
                yVec = [yVec(1)+uSz, yVec(2)+uSz, yVec(3)+uSz, yVec(4)+uSz, yVec(5)+uSz];
            else
                %box.YData = [yVec(1)+uSz, yVec(2)+uSz, yVec(3)+uSz, yVec(4)+uSz, yVec(5)+uSz];
                yVec = [yVec(1)+uSz, yVec(2)+uSz, yVec(3)+uSz, yVec(4)+uSz, yVec(5)+uSz];
            end
            hold off
            %% stop writing code here
        case 'w' %the user wants to move north
            %% TODO: WRITE CODE HERE
            if yVec(3) > xMax%
                yVec = [yVec(1), yVec(2), yVec(3), yVec(4), yVec(5)];
            else
                yVec = [yVec(1)-uSz, yVec(2)-uSz, yVec(3)-uSz, yVec(4)-uSz, yVec(5)-uSz];
            %row start +5 and row end + 5
            end
            hold off
            %% stop writing code here
        case 'a' %the user wants to move west
            %% TODO: WRITE CODE HERE
            if xVec(3) < xMax
                xVec = [xVec(1), xVec(2), xVec(3), xVec(4), xVec(5)];
            else
                xVec = [xVec(1)-uSz, xVec(2)-uSz, xVec(3)-uSz, xVec(4)-uSz, xVec(5)-uSz];
            %row start +5 and row end + 5
            end
            hold off
            %% stop writing code here
        case 'd' %the user wants to move east
            %% TODO: WRITE CODE HERE
            if xVec(3) < xMax
                xVec = [xVec(1), xVec(2), xVec(3), xVec(4), xVec(5)];
            else
                xVec = [xVec(1)+uSz, xVec(2)+uSz, xVec(3)+uSz, xVec(4)+uSz, xVec(5)+uSz];
            %row start +5 and row end + 5
            hold off
            end
            %% stop writing code here
        case 'q'
            %user quits
            break;
    end
    set(gcf,'CurrentCharacter','n');
    %% TODO: WRITE CODE HERE
    %surface plot limit 
    box.YData = [yVec(1), yVec(2), yVec(3), yVec(4), yVec(5)]; %plot the vectors
    box.XData = [xVec(1), xVec(2), xVec(3), xVec(4), xVec(5)];
    subplot(1,2,1);
    surf(latConv,longConv,elev);%replot the surface graph
    %xlim(xVec(1));
    %ylim(yVec(1));
    %% stop writing code here
    pause(0.1);
end
end

%% don't touch any of this.
function callback(hObject, callbackdata)

end