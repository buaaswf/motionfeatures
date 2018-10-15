% Get list of all BMP files in this directory
% DIR returns as a structure array.  You will need to use () and . to get
% the file names.
path='H:\reid\PRW-v16.04.20\PRW-v16.04.20\frames\';
path='H:\reid\merge\train_all\train_all\';
path='H:\reid\merge\gallery\gallery\';
path='H:\codebak\20180607\20180607\code\PRW_pytorch\train\';
path='H:\codebak\20180607\20180607\code\PRW_pytorch\PRW_pytorch\PRW_pytorch\train_all\';
path='I:\reid\merge\SS_crop\';
path='I:\reid\MSMT17_V1\train\';
path='I:\UAV\Single-Object Tracking\test\';
%imagefiles = dir('H:\reid\0001\0001\*.jpg');  %F:\reid\wild    
imagefiles = dir(strcat(path,'**\*.jpg'));  %F:\reid\wild  
%imagefiles = dir('F:\reid\SSGoDec\SSGoDec\SSGoDec\picture\*.bmp');
nfiles = length(imagefiles);    % Number of files found
imageMatrix = uint8(zeros(144,176,nfiles));
for ii=1:nfiles
   currentfilename = imagefiles(ii).name;
   currentfolder = imagefiles(ii).folder;
   dataf=fullfile(currentfolder,currentfilename);
   try
        currentimage = imread(fullfile(currentfolder,currentfilename));
   catch
       continue
   end

%   currentimage = imread(strcat('F:\reid\SSGoDec\SSGoDec\SSGoDec\picture\',currentfilename));
   currentimage = imresize(currentimage, [144,176]);
   currentimage =rgb2gray(currentimage);
   imageMatrix(:,:,ii) = currentimage;
end
%images=cell2mat(images);
 %save(images,'var');
 save('visdrone.mat','imageMatrix');
 save('visdronenames.mat','imagefiles');