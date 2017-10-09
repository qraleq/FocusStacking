function [focusMapMorph] = morphological_operations(focusMap, plot)


se=strel('disk', 4, 4);
focusMapMorph=imclose(focusMap, se);
focusMapMorph=imfill(focusMapMorph, 'holes');

% tresh_low=10;
% ind_below=(focusMapMorph<tresh_low);
% focusMapMorph(ind_below) = 0;

if(plot)
    figure;
    %     imshow(uint8(focusMapMorph));
    imagesc(focusMapMorph);
    %     mesh(focusMapMorph)
end