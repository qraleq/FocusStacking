function [fm, fmValue] = CURV(image, plot)

        if ~isinteger(image), image = im2double(image);
        end
        M1 = [-1 0 1;-1 0 1;-1 0 1];
        M2 = [1 0 1;1 0 1;1 0 1];
        P0 = imfilter(image, M1, 'replicate', 'conv')/6;
        P1 = imfilter(image, M1', 'replicate', 'conv')/6;
        P2 = 3*imfilter(image, M2, 'replicate', 'conv')/10 ...
            -imfilter(image, M2', 'replicate', 'conv')/5;
        P3 = -imfilter(image, M2, 'replicate', 'conv')/5 ...
            +3*imfilter(image, M2, 'replicate', 'conv')/10;
        fm = abs(P0) + abs(P1) + abs(P2) + abs(P3);

        fm=fm.^2;

        fmValue = mean2(fm);
        
if(plot)
    figure;
    imshow(fm);
    %mesh(fm);
end
