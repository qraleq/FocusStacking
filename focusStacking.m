clear all
close all
clc

addpath('data')
addpath('utilities')

tic

%% LOAD IMAGES
mod='manual';

[images_gray, images_rgb]=load_images('Y:\Projects\MATLAB Projects\Focus Stacking\data\', false, mod);

%% IMAGE REGISTRATION
referent_image=images_gray(:,:,1);

for i=2:size(images_gray,3)
    images_gray(:,:,i)=image_subpixel_registration(referent_image, images_gray(:,:,i), 0);
end

%% PROCESS IMAGES - FOCUS STACK

close all

% laplacian focus measure - CONTRAST
[focusMap, fValue]=LAPM(images_gray, false, false);

weightMap=weighting_map(focusMap, 1);

[maximumFocusValues, maximumFocusIdx]=max(weightMap,[],3);

figure
imagesc(maximumFocusIdx)

% fs_naive=naive_fusion(images_rgb, weightMap, true);
fs_pyramid=pyramid_fusion(images_rgb, weightMap, 5);

figure
imshow(fs_pyramid)
title('Focus Stacked Image')

toc

