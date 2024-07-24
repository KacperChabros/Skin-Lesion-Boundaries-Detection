function [firstEdge, secondEdge] = createBorder(firstRoot, secondRoot, ...
    offest, min, max)
% The createBorder function is used to calculate and clamp the extreme
% values of the index range (used for marking edges on the original image).
% ----------
% firstRoot - the root from the first side
% secondRoot - the root from the second side
% offset - the number of pixels to extend the range in one direction
% min - the minimum clamping value
% max - the maximum clamping value
% firstEdge - the index range defining the position of the visual edge
% at the first root
% secondEdge - the index range defining the position of the visual edge
% at the second root
    firstStart = clampValue(firstRoot-offest, min, max);
    firstStop = clampValue(firstRoot+offest, min, max);
    firstEdge = firstStart:firstStop;
    secondStart = clampValue(secondRoot-offest, min, max);
    secondStop = clampValue(secondRoot+offest, min, max);
    secondEdge = secondStart:secondStop;
end

