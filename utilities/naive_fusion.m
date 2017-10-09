function I_fused = naive_fusion ( I , W, plot)
% This function performs navie fusion of original image set, leading to
% undesirable artifacts
% Arguments:
% I_fused: final fused image results from naive fusion
% I: original image stack
% W: weighting map stack

[ row, col, N] = size( W );

I_fused = zeros( row, col, 3 );
for i = 1: N
    I_fused = I_fused + I(:,:,:,i).* repmat( W(:,:,i), [1, 1, 3]);
end 

if(plot)
    figure
    imshow(I_fused)
    title('Naive FS')
end


