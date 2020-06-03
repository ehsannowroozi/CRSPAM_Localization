
% Function for Generate Malacious Data H1

function[img_proc] = GenerateMalacious(I, proc_type)

if strcmp(proc_type,'Resize')
     
   I1(:,:,1)=imresize(I(:,:,1),0.8,'bicubic');
    I1(:,:,2)=imresize(I(:,:,2),0.8,'bicubic');
     I1(:,:,3)=imresize(I(:,:,3),0.8,'bicubic');
   
      img_proc=I1;
    
else
    error('Unknown processing!')
end


