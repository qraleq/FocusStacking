function W = weighting_map( C, Wc )


W = ones( size(C) );

if ( Wc > 0 )
    W = W.* C.^ Wc;
end



% normalize weights for each pixel
% make sure that weights sum to one
W = W + 1e-12; %avoids division by zero
W = W./repmat( sum(W,3), [1 1 size(W, 3)] );



