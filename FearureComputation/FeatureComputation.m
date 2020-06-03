
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% The script
% 1. After make a dataset such as H0 and H1, know called H0 and H1
%  To extract the the feature
% 2.By default we used to SPAM686.M fore feature computation
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

clc
clear
close all

% Add a ltest version of LIBSVM 3.22 package
%addpath(genpath('./Libsvm-3.17'));

% Read the Path of H0 and H1 ( The path in MAC address, for windows please
% changed
H0 = 'F:\RRNN\RN\Final_RN\Resize_RN\MakeDataset\H0\';
H1 = 'F:\RRNN\RN\Final_RN\Resize_RN\MakeDataset\Malacious_Resize_H1\';


%----------------------------------------------------------
%            1. Feature Computation SPAM686.M
%----------------------------------------------------------

H0 = computeAllFeatures(H0);
H1 = computeAllFeatures(H1);


save('CRSPAM_features_H0_H1.mat', 'H0', 'H1');


