%% ex2
close;
clear;
delete(imaqfind());

videoOS = 'winvideo';
info = imaqhwinfo(videoOS);
info.DeviceInfo
camnum = 1;
vid = videoinput(videoOS, camnum, "RGB24_848x480");
preview(vid);

triggerconfig(vid, 'manual');
start(vid)

% A = getdata(vid);
A = getsnapshot(vid);
stop(vid);

imshow(A);
delete(vid);

%% ex3
close;
clear;
delete(imaqfind());

videoOS = 'winvideo';
info = imaqhwinfo(videoOS);
info.DeviceInfo
camnum = 1;
vid = videoinput(videoOS, camnum, "RGB24_848x480");
%preview(vid);

triggerconfig(vid, 'manual');
start(vid)

try
    figure;
    while 1
        A = getsnapshot(vid);
        
        A_gray = rgb2gray(A);
        A_bin = imbinarize(A_gray,"global");
        
        subplot(2, 2, 2);
        imshow(A);
        subplot(2, 2, 3);
        imshow(A_gray);
        subplot(2, 2, 4);
        imshow(A_bin);
    
        pause(0.05);
    end
catch
    stop(vid);
end

%% ex4
close;
delete(imaqfind());

cam = webcam(1);

figure;
while 1
    A = snapshot(cam);
    A = fliplr(A);

    A_gray = rgb2gray(A);
    A_bin = imbinarize(A_gray, 0.98);

    
    stats = regionprops(A_bin, "Centroid", "Area");
    areas = cat(1,stats.Area);
    centroids = cat(1,stats.Centroid);
    
    subplot(1, 2, 1);
    hold on;
    imshow(A);
    if ~isempty(centroids)
        [m, i] = max(areas);
        plot(centroids(i,1),centroids(i,2),'b*')
    end

    subplot(1, 2, 2);
    imshow(A_bin);

    pause(0.05);
end

%% ex5
close;
delete(imaqfind());

imgNames = {'Imagem_004.jpg', 'Imagem_006.jpg', 'Imagem_013.jpg'};

for i = 1:length(imgNames)
    A = imread("imgs5\" + imgNames{i});
    A_gray = rgb2gray(A);
    A_bin = imbinarize(A_gray, 0.60);

    stats = regionprops(A_bin, "Orientation", "Area");
    areas = cat(1,stats.Area);
    orientations = cat(1,stats.Orientation);
    stats = regionprops(A_bin, "Centroid", "Area");
    centroids = cat(1,stats.Centroid);
    
    figure;

    subplot(1, 2, 1);
    hold on;
    imshow(A);
    if ~isempty(centroids)
        [m, idx] = max(areas);
        orientations(idx)
    end

    subplot(1, 2, 2);
    imshow(A_bin);
end


%% 
delete(imaqfind());