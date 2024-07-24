clear
dirPath = "data/melanoma/";
fileNameBluePrint = "results/img/melanoma_imgs";

epsilon = 1;
zeroValue = 0.55;
imgsOnOnePlot = 100;

dirNames = dir(dirPath);
numberOfImgs = length(dirNames) - 2;
numberOfPlots = ceil(numberOfImgs / imgsOnOnePlot);

for i=1:numberOfPlots
    start = 3+(i-1)*imgsOnOnePlot;
    stop = clampValue((i)*imgsOnOnePlot+2, start, length(dirNames));
    range = start:stop;
    edgesCell = cell(1, length(range));
    for j=range
        path = dirPath + dirNames(j).name;
        image = im2double(imread(path));
        edges = findEdges(image, epsilon, zeroValue);
        edges = uint8(edges .* 255);
        edgesCell{j-range(1)+1} = edges;
        clear image;
        clear edges;
    end
    fileLocation = fileNameBluePrint+range(1)+"-"+range(end)+".jpg";
    saveFigure(edgesCell, length(range), fileLocation);
    clear edgesCell;
end
