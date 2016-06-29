% ENGR1120 Tennessee Tech
% Noah Huber-Feely 6/29/2016
% Lab 10 (Alternate) - Game of Life

continueLiving = 1;
lifeBoard = [1:800, 1:800];

while continueLiving
    lifeBoard = kill(lifeBoard);
    imshow(lifeBoard);
end