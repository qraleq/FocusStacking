function [images_gray, images_rgb]=load_images(directory, plot, mode)

% This function is used to load grayscale and RGB images

if(strcmp(mode,'auto'))
    files = dir ( [ directory '/*.jpg'] );
    N = length ( files );
    [ row, col, channel ] = size(  imread( [directory '/' files(1).name] )  );
    images_gray = zeros( row, col, N );
    images_rgb = zeros( row, col, 3, N );
    
    for i=1:N
        name = [ directory '/' files(i).name ];
        
        % convert [0, 255] to [0,1]
        I = double( imread(name) ) / 255;
        
        % check if images have the same dimension
        if ( size(I,1) ~= row || size(I,2) ~= col || size(I, 3)~= channel )
            error('Images should have the same dimension!');
        end
        
        images_rgb(:,:,:,i)=I;
        
        images_gray(:,:,i) = rgb2gray(I);
        
        
        if(plot)
            figure
            subplot(121)
            imshow(images_rgb(:,:,:,i))
            title('Color')
            subplot(122)
            imshow(images_gray(:,:,i))
            title('Gray')
        end
    end
    
end




%% ALTERNATIVE LOAD IMAGES - MULTISELECT

if(strcmp(mode,'manual'))
    cd(directory)
    cd ..
    [files, path]=uigetfile('*.*','MultiSelect', 'on');
    cd ..
    
    for i=1:length(files)
        filename=files{i};
        images_rgb(:,:,:,i)=im2double(imread(fullfile(path, filename)));
        images_gray(:,:,i)=(rgb2gray(images_rgb(:,:,:,i)));
        
        if(plot)
            figure
            subplot(121)
            imshow(images_rgb(:,:,:,i))
            title('Color')
            subplot(122)
            imshow(images_gray(:,:,i))
            title('Gray')
        end
        
    end
end

