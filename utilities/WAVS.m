function [fm, fmValue] = WAVS(image, plot, morph)

wname='db2';
wlevel=3;
[C,S] = wavedec2(image, wlevel, wname);
H = wrcoef2('h', C, S, wname, wlevel);
V = wrcoef2('v', C, S, wname, wlevel);
D = wrcoef2('d', C, S, wname, wlevel);
fm = abs(H) + abs(V) + abs(D);



fm=fm.^2;

fmValue = mean2(fm);


if(plot)
    figure;
    imshow(fm);
    %mesh(fm);
end