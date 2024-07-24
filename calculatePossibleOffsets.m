function [offsetsVer, offsetsHor] = calculatePossibleOffsets(height, width)
% The function is used to calculate offsets that will be checked to select
% the most appropriate offset that can mitigate the vignetting effect.
% height - the height of the image
% width - the width of the image
% offsetVer - possible vertical offsets
% offsetsHor - possible horizontal offsets
    scaleHor = ceil(width / 1000);
    offsetsHor = 0:25:200;
    offsetsHor = offsetsHor .* scaleHor;
    scaleVer = round(height / 1000);
    offsetsVer = 0:25:200;
    offsetsVer = offsetsVer .* scaleVer;
end

