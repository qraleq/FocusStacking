function [registered] = image_subpixel_registration(f,g,plot)

f = im2double(f);
g = im2double(g);

[output, Greg] = dftregistration(fft2(f),fft2(g), 5);

rowshift=output(1,3);
colshift=output(1,4);

registered=abs(ifft2(Greg));
reference=abs(f);

if(plot)
    %     figure(1);
    %     subplot(1,2,1);
    %     imshow(reference);
    %     title('Reference image, f(x,y)')
    %     subplot(1,2,2);
    %     imshow(registered);
    %     title('Registered image, gr(x,y)')
    
    figure
    imshowpair(reference,registered,'diff');
end



