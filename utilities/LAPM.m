function [fm, fValue] = LAPM(images_gray, plot, morph)


fm = zeros( size(images_gray, 1), size(images_gray, 2), size(images_gray, 3) );
fValue=zeros(size(images_gray,3));

for i=1:size(images_gray,3)
    
    % take one image from stack
    I=images_gray(:,:,i);
    
    % create laplacian filter with user defined sigma
    h=fspecial('laplacian', 0.1);
    
    % filter image with laplacian filter
    % take absolute values of filtering result
    % convert values to double precision
    fm(:,:,i)=double(abs(imfilter(I, h ,'replicate'))).^2;
    
    % OPTIONAL - MORPHO OPERATIONS
    if(morph)
        fm(:,:,i)=morphological_operations(fm(:,:,i), true);
    end
    
    % fmValue is image global focus measure
    fValue(i) = mean2(fm(:,:,i));
    
    % plot focus map stack
    
    if(plot)
        figure
        %         imagesc(fm(:,:,i));
        mesh(fm(:,:,i));
        title('Focus Map')
    end
    
    
    
    
    
    %% ALTERNATIVE - USER DEFINED LAPLACIAN FILTERING
    
    % %     create laplacian filter
    %     h = [   0  1  0;
    %             1 -4  1;
    %             0  1  0   ];
    %
    % %     filter image with laplacian filter
    % %     take absolute values of filtering result
    % %     convert values to double precision
    %     fm(:,:,i)=double(abs(imfilter(I, h ,'replicate'))).^2;
    %
    % %     fmValue is image global focus measure
    %     fValue(i) = mean2(fm(:,:,i));
    %
    % %     plot focus map stack
    %
    %     if(plot)
    %         figure
    %         imagesc(fm(:,:,i));
    %         mesh(fm(:,:,i));
    %         title('Focus Map')
    %     end
    %
    
    
    
end