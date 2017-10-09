function I_fused = pyramid_fusion(I, W, level)

[row, col, N]=size( W );

if ~exist( 'level' )
    % compute the largest number of pyramid level
    level = floor( log( min( row, col) ) / log(2) );
end

% create empty pyramid to record the fused pyramid of the final result
pyr = gaussian_pyramid(zeros( row, col, 3), level);

for i = 1 : N
    % construct pyramid from each input image
    % Gaussian pyramid of weighting map
    pyrW = gaussian_pyramid( W(:, :, i), level );
    
    % Laplacian pyramid of input image
    pyrI = laplacian_pyramid( I(:, :, :, i), level, size(pyrW,1), size(pyrW,2));
    
    % blend
    for n = 1 : level
        w = repmat( pyrW{ n }, [1 1 3] ) ;
        pyr{ n } = pyr{ n } + w .* pyrI{ n };
    end
end

I_fused = reconstruct_laplacian_pyramid( pyr );
