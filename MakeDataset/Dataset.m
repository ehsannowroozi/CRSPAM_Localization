
clc
clear
close all


% Read RAISE2K Image Dataset
Dataset_RAISE8K = 'F:/RAISE8K/';  % For Widows Please Changed File Direction

out_folder_root = sprintf('F:/RRNN/RN/Final_RN/Resize_RN/MakeDataset/');

tiff_images = dir([Dataset_RAISE8K '*.TIF']);

N = size(tiff_images,1);     % N is the number of RAISE2K images

%N=7997;

%%%%%%  Create folders H0 and H1 %%%%%%%
% Create output folders
if ~exist(out_folder_root,'dir')
    mkdir(out_folder_root);
end

% H0 Folder Root
if ~exist([out_folder_root 'H0'],'dir')
    mkdir([out_folder_root 'H0']);
end

% % % % % H1 Folder Root
% % % % if ~exist([out_folder_root 'H1'],'dir')
% % % %     mkdir([out_folder_root 'H1']);
% % % % end

%--------------------------------------------------------------------------
%                      Default Quality Factor
%--------------------------------------------------------------------------

QF = 95;



%--------------------------------------------------------------------------
% Create Data of H0 and H1
%--------------------------------------------------------------------------

% Images are In RGB Scale
% Loop through all the images
progressbar('Images', 'Proc', 'Q1')

for i=1:N   % Loop First
    
    tic;
    fprintf('Processing image %s. ', tiff_images(i).name);
    progressbar(i/N,[],[]);
    
    img_name = [Dataset_RAISE8K tiff_images(i).name];
    
    I = imread(img_name);
    
    % Subsampling for RGB Level
    while max(size(I)) > 1600
        I=I(1:2:end,1:2:end,:);
    end
    
    
    %------------------------------------------------------------------
    % The Hyphothesis - Legitimate Data (H0)
    % First Subsample + Compress with QF 95 + Store TIFF
    %------------------------------------------------------------------
    
    
    %imwrite(I, H0, 'jpeg', 'Quality', QF);
    HH='temp0.jpg';
    imwrite(I, HH, 'jpeg', 'Quality', QF);
    JJ=imread(HH);
    delete temp0.jpg;
    H00 = sprintf('%s/H0/%s_Q_%d.tif',out_folder_root, strtok(tiff_images(i).name,'.'),QF);
    imwrite(JJ, H00, 'tif');
    
    
    %------------------------------------------------------------------
    % CThe Hyphoyhesis - Malacious Data  (H1)
    % First Subsample + Compress with QF 95 + Store TIFF
    %------------------------------------------------------------------
    
    
    PROCESSING_Types  =  {'Resize'};
    
    for k = 1: numel(PROCESSING_Types)  % Second Loop
        
        progressbar([],k/numel(PROCESSING_Types),[]);
        
        PROCESSING_Type =  PROCESSING_Types{k};
        
        
        Malacious_Dir = [out_folder_root 'Malacious_'  PROCESSING_Type '_H1']; % Design the directory
        
        if ~exist(Malacious_Dir,'dir')
            mkdir(Malacious_Dir);
        end
        
        for q=1:numel(QF) % Third Loop
            
            progressbar([],[],q/numel(QF));
            
            H1 = 'tmp.jpg';
            imwrite(I, H1, 'jpeg', 'Quality', QF);
            
            J = imread(H1);
            delete tmp.jpg
            
            img_proc = GenerateMalacious(J, PROCESSING_Type);
            
            Malacious = sprintf('%s_QF_%d.tif', strtok(tiff_images(i).name,'_'), QF);
            imwrite(img_proc, [Malacious_Dir '/' Malacious],'tif');
            
            
            
        end % End of Third Loop
        
        
        
    end  % End of Second Loop
    
    t=toc;
    fprintf('Elapsed Time: %.3f sec.\n',t);
end  % End of Loop First


progressbar(1)