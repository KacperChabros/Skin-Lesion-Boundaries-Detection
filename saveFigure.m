function [] = saveFigure(edgesCell, numberOfImgs, fileLocation)
% The function is used to save an image containing thumbnails of pictures with
% marked edges.
% edgesCell - a Cell array containing matrices with RGB images with
% marked edges
% numberOfImgs - the number of pictures in one image
% fileLocation - the target location (including name and extension) of the image
% with thumbnails
    figure(units='normalized', OuterPosition=[0 0 1 1], Visible='off');
    t = tiledlayout(10,10, TileSpacing="none");
    for j=1:numberOfImgs
       nexttile
       imshow(edgesCell{j})
    end
    clear edgesCell;
    saveas(gcf, fileLocation);
    clf;
    close(gcf);
end

