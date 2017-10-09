function pyr = laplacian_pyramid( I, level, row, col )
% This function contructs Laplacian pyramid
% Arguments
% pyr: constructed Laplacian pyramid 
% I: input image  
% level: number of levels in the pyramid

% allocate memory to the pyramid 
pyr = cell( level, 1 );
% defines the filter used to construct the pyramid

filter = [   0.0039    0.0156    0.0234    0.0156    0.0039
             0.0156    0.0625    0.0938    0.0625    0.0156
             0.0234    0.0938    0.1406    0.0938    0.0234
             0.0156    0.0625    0.0938    0.0625    0.0156
             0.0039    0.0156    0.0234    0.0156    0.0039   ];

% filter = fspecial('laplacian', 0.2);
J = I;

for n = 1 : level - 1
    % low pass filter and down sample
    R=imfilter(J, filter ,'replicate');
%     I = R( 1: 2: size(J,1), 1: 2: size(J,2), : );
    I=imresize(R, 0.5);

    % check if the up sampled version has to be odd
    odd = 2 * size(I) - size(J); 
    
    % store difference between image and upsampled low pass version
    pyr{ n } = J - up_sample( I, odd, filter);
    
    % continue with low pass image
    J = I; 
end

% copy the residual low pass image the coarest level of the pyramid
pyr{ level } = J; 
  
