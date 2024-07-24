function [clampedValue] = clampValue(value, minVal, maxVal)
% The function is used to clamp the given value by the maximum and minimum
% values. If the value is less than the minimum, it becomes the minimum,
% and if it is greater than the maximum, it becomes the maximum.
% value - the value to be clamped
% minVal - the minimum clamping value
% maxVal - the maximum clamping value
% clampedValue - the value clamped from below by minVal and from above
% by maxVal
    clampedValue = max(min(value, maxVal), minVal);
end

