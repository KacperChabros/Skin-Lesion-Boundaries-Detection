function [root] = findRoot(func, range, epsilon, zeroValue)
% The function applies the bisection method to find the root.
% func - a vector containing the function values in the given range.
% range - the range of the above values to be considered
% epsilon - the value specifying the acceptable accuracy (the width
% of the final interval)
% zeroValue - the value specifying the scale offset on the Y-axis.
% The root sought is the point with the value zeroValue.
% root - the found root
    a = range(1);
    b = range(end);
    
    if( ((func(a) - zeroValue) * (func(b) - zeroValue) ) > 0 )
        root = NaN;
        return
    end

    c = round((a+b)/2);
    while( abs( b - a ) > epsilon)
        c = round(( a + b ) / 2);

        if( ( func(a) - zeroValue ) * (func(c) - zeroValue ) < 0 )
            b = c;
        else
            a = c;
        end
        
    end
    root = round((a+b)/2);
end

