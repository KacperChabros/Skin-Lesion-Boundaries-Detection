function [stretchedImage] = stretchHistogram(image)
% The function is used to stretch the histogram of the input image.
% image - the input image whose histogram is to be stretched
% stretchedImage - the output image with the stretched histogram.
    minVal = double(min(image(:)));
    maxVal = double(max(image(:)));
    stretchedImage = (double(image) - minVal) / (maxVal - minVal);
end

