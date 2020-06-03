clc
clear 
close all

%Add LibSvm Package
addpath(genpath('./Libsvm-3.17'));


% ws = window size (must be odd number)
% Img = input image (all images)
% skip = sampling step
% label +1 for Legitimate case
% label -1 for Malicious case

prompt='Enter window size (Must be odd number): ' ;
ws=input(prompt); %ws=17

prompt='Enter skip number (sampling step): ' ;
skip=input(prompt); %skip=9


Img=imread('F:\RRNN\RN\Final_RN\Resize_RN\Test\orgImages\20.jpg'); %origional Image

imshow(Img);

ImgM = RN (Img,ws,skip);


% figure,
% subplot(1,2,1); imshow(Img); title('Input Image');
% subplot(1,2,2); imshow(ImgM); title('Map Image');


% out_folder_root = sprintf('F:/RRNN/RN/Final_RN/Hist_RN/');
% 
% if ~exist([out_folder_root 'map'],'dir')
%     mkdir([out_folder_root 'map']);
% end
% 
% tiff_name = sprintf('map.tif',out_folder_root);
imwrite(ImgM,'20.tif')

%----------------------------------------------------
%----------------------------------------------------
function [ ImgM ] = RN ( Img, ws, skip)

load('model_2C_CRSPAM.mat','model_2C_CRSPAM');



%I=imread(Img);

%hsv=rgb2hsv(Img);


%V=Img(:,:,3);


%[OrgRow,OrgCol]=size(V);


[R ,C, ~]=size(Img);

i=1;
j=1;
%ii=1;

  ii=1;
  jj=1;

while (i+ws-1) <= R
    
    i
    
    while (j+ws-1) <= C
        
        
        blk= Img(i:i+ws-1 , j:j+ws-1,:);
        
        %-------------------------------------------
        % Calculate feature computation SPAM686V
        %-------------------------------------------
        
        F= CR(blk); 
        F = F';
        
        %-------------------------------------------
        % SvmPredict
        %-------------------------------------------

         [predict_label,~,~]=svmpredict(1, F, model_2C_CRSPAM,'-b 0');
         
  
         %---------
        
        map(ii,jj) = predict_label;
       
         map;
       %---------------------------------------------------------
        
        j = j+skip;
        jj = jj+1;
        
    end
    j=1;
    jj=1;
    i = i+skip;
    ii = ii+1;
end

[smallr,smallc]=size(map);

bigmap = imresize(map, [(smallr-1)*skip+1 (smallc-1)*skip+1], 'nearest');
paddedmap = padarray(bigmap, [(ws+1)/2 (ws+1)/2], 'symmetric', 'both');
[Rm,Cm]=size(paddedmap);

truemap = ones(R,C);
truemap(1:Rm,1:Cm) = paddedmap;
%imshow(truemap);


%---
ImgM(:,:,1)=uint8(100*(1-truemap));
ImgM(:,:,2)=Img(:,:,2);
ImgM(:,:,3)=Img(:,:,3);


%---

end  % End of function
