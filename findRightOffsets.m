function [offset1, offset2] = findRightOffsets(imageWindow, startPix, endPix, offsets, zeroValue)
% findRightOffsets finds the appropriate offset that has a chance
% to mitigate the vignetting effect. It selects the appropriate offset from
% the possible offsets calculated by the function
% calculatePossibleOffsets.
% imageWindow - part of the image where one of the dimensions is equal to 1 (vector)
% startPix - the starting pixel
% endPix - the ending pixel
% offsets - vector of possible offsets (result of the function
% calculatePossibleOffsets).
% zeroValue - the value specifying the scale offset on the Y-axis.
% The root sought is the point with the value zeroValue.
% offset1 - the selected appropriate offset for the first side
% offset2 - the selected appropriate offset for the second side
    offset1 = 0;
    offset2 = 0;
    for i=1:length(offsets)
        if( imageWindow(startPix+offsets(i)) > zeroValue)   
            offset1 = offsets(i);
            break;
        end
    end

    for i=1:length(offsets)
        if( imageWindow(endPix-offsets(i)) > zeroValue)   
            offset2 = offsets(i);
            break;
        end
    end
end

