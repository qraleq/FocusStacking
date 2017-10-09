function pyr = gaussian_pyramid( I, level, plot )
% This function constructs Gaussian pyramid
% Arguments:
% pyr: constructed Gaussian pyramid 
% I: input image  
% level: number of levels in the pyramid

% allocate memory to the pyramid 
pyr = cell( level, 1 );

% copy input image to the finest level of pyramid
pyr{1} = I;

% defines the filter used to construct the pyramid

filter = [   0.0039    0.0156    0.0234    0.0156    0.0039
             0.0156    0.0625    0.0938    0.0625    0.0156
             0.0234    0.0938    0.1406    0.0938    0.0234
             0.0156    0.0625    0.0938    0.0625    0.0156
             0.0039    0.0156    0.0234    0.0156    0.0039   ];

% filter = fspecial('gaussian', [3 3], 0.5);
% filter and downsample to create pyramid of next level

for n = 2 : level
    R=imfilter(I, filter ,'replicate');
    I = R( 1: 2: size(I,1), 1: 2: size(I,2), : );
    pyr{n} = I;
    
%     figure
%     imshow(I)
end

