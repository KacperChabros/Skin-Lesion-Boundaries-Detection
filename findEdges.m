function [edges] = findEdges(image, epsilon, zeroValue)
% The function performs edge detection using the bisection method. The function
% stretches the histogram of the input image and divides it into
% two vertical windows and two horizontal windows. Each of these windows is
% traversed by a window where one of the dimensions is 1. Zero crossings are
% found using the bisection method.
% image - the input image (RGB) on which to find edges
% epsilon - the value specifying the acceptable accuracy (the width
% of the final interval)
% zeroValue - the value specifying the scale offset on the Y-axis.
% The zero crossing sought is the point with the value zeroValue.
% edges - the output image (RGB), of the same size as the original, with
% edges marked in red.
    
    edges = image;
    image = rgb2gray(image);
    
    image = stretchHistogram(image);
    
    [height,width] = size(image);

    borderOffset = ceil(width / 1000) * 8;
    borderOffset = max(borderOffset, ceil(height / 1000)*8);
    
    midHor = floor(width/2);
    midVer = floor(height/2);
    [offsetsVer, offsetsHor] = calculatePossibleOffsets(height, width); 

    for i=1:height
        [offsetLeft, offsetRight] = findRightOffsets(image(i,:), 1, width, ...
            offsetsHor, zeroValue);
        rangeX1 = 1+offsetLeft:midHor;
        rangeX2 = midHor+1:width-offsetRight;
        rootLeft = findRoot(image(i, :), rangeX1, epsilon, zeroValue);
        rootRight = findRoot(image(i, :), rangeX2, epsilon, zeroValue);
        [leftEdge, rightEdge] = createBorder(rootLeft, rootRight, ...
            borderOffset, 1, width);
        if(~isnan(rootLeft))
            edges(i, leftEdge, 1) = 1;
            edges(i, leftEdge, 2:3) = 0;
        end
        if(~isnan(rootRight))
            edges(i, rightEdge, 1) = 1;
            edges(i, rightEdge, 2:3) = 0;
        end
    end
    
    for i=1:width
        [offsetTop, offsetBottom] = findRightOffsets(image(:, i), 1, height, ...
            offsetsVer, zeroValue);
        rangeY1 = 1+offsetTop:midVer;
        rangeY2 = midVer+1:height-offsetBottom;
        rootTop = findRoot(image(:, i), rangeY1, epsilon, zeroValue);
        rootBottom = findRoot(image(:, i), rangeY2, epsilon, zeroValue);
        [topEdge, bottomEdge] = createBorder(rootTop, rootBottom, ...
            borderOffset, 1, height);
        if(~isnan(rootTop))
            edges(topEdge, i, 1) = 1;
            edges(topEdge, i, 2:3) = 0;
        end
        if(~isnan(rootBottom))
            edges(bottomEdge, i, 1) = 1;
            edges(bottomEdge, i, 2:3) = 0;
        end
    end
end

