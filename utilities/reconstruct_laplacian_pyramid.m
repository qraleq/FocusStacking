function R = reconstruct_laplacian_pyramid( pyr )
% This function reconstructs image from Laplacian pyramid
% Arguments:
% R: reconstructed image from Laplacian pyramid
% pyr: Laplacian pyramid generated by function 'laplacian_pyramid'

row = size( pyr{1}, 1 );
col = size( pyr{1}, 2 );
level = length( pyr );

% start with low pass residual
R = pyr{ level };
% defines the filter
% filter = fspecial('gaussian', [3 3], 0.5);

filter = [   0.0039    0.0156    0.0234    0.0156    0.0039
             0.0156    0.0625    0.0938    0.0625    0.0156
             0.0234    0.0938    0.1406    0.0938    0.0234
             0.0156    0.0625    0.0938    0.0625    0.0156
             0.0039    0.0156    0.0234    0.0156    0.0039   ];

for n = level - 1 : -1 : 1
    % upsample and and add to current level
    odd = 2 * size( R ) - size( pyr{ n } );
    R = pyr{ n } + up_sample( R, odd, filter );
    
end
