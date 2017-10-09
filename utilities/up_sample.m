function U = up_sample( I, odd, filter )
% This function perfoms up sampling by interpolation
% Arguments:
% R: up sampled image of the low pass filterd version
% I: input image
% odd: 2-vector of binary values, indicates whether the upsampled image should
% have odd size for the respective dimensions
% filter: up sampling filter

% pad the image with a 1-pixel border
I = padarray( I, [ 1 1 0 ], 'replicate' );

% the padding is now 2 pixels wide
row = 2 * size( I, 1 );
col = 2 * size( I, 2 );
k = size( I, 3 );
% allocate memory for up sampled result 
U = zeros( row, col, k );
% fill the original image into the odd position of the up sampled image
% make sure to increase the original image by 4 times for interpolation 
U( 1: 2: row, 1: 2: col, : ) = 4 * I; 

% Gaussian interpolation to up sample using the same filter for blurring
U = imfilter( U, filter );      


% remove the border
U = U( 3 : row - 2 - odd(1), 3 : col - 2 - odd(2), : );

