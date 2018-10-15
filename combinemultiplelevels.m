% Get list of all BMP files in this directory
% DIR returns as a structure array.  You will need to use () and . to get
% the file names.
% path='H:\reid\PRW-v16.04.20\PRW-v16.04.20\frames\';
% path='H:\reid\merge\train_all\train_all\';
% path='H:\reid\merge\gallery\gallery\';

%%%
%%%%%%
%%% 5 paths
%D:\swfreidcode\data\SSGoDec\(3¸ö)
%D:\swfreidcode\data\PRW\SS_crop\
%D:\swfreidcode\data\PRW\lowrank_filteraddd_out\gallery\gallery\


path1='C:\Users\China\Desktop\0514\0514\gallery\5521\';
path2='C:\Users\China\Desktop\0514\0514\gallery\5523\';
path3='C:\Users\China\Desktop\0514\0514\gallery\5525\';
path4='C:\Users\China\Desktop\0514\0514\gallery\5527\';
path5='C:\Users\China\Desktop\0514\0514\gallery\5529\';
output='C:\Users\China\Desktop\0514\0514\gallery\com\';
%imagefiles = dir('H:\reid\0001\0001\*.jpg');  %F:\reid\wild    
imagefiles = dir(strcat(path1,'**\*.jpg'));  %F:\reid\wild  
%imagefiles = dir('F:\reid\SSGoDec\SSGoDec\SSGoDec\picture\*.bmp');
nfiles = length(imagefiles);    % Number of files found
imageMatrix = uint8(zeros(144,176,nfiles));
for ii=1:nfiles
   currentfilename = imagefiles(ii).name;
   f1=strcat( path1,currentfilename);
   f2=strcat( path2,currentfilename);
   f3=strcat( path3,currentfilename);
   f4=strcat( path4,currentfilename);
    f5=strcat( path5,currentfilename);
   outputfilename =strcat( output,currentfilename);
   currentfolder = imagefiles(ii).folder;
   image1 = process(f1);
   image2 = process(f2);
   image3 = process(f3);
   image4 = process(f4);
   image5 = process(f5);
   image = (image1+1-image2+1-image3+image4+image5)/5/255;
   imwrite(image,outputfilename);


%   currentimage = imread(strcat('F:\reid\SSGoDec\SSGoDec\SSGoDec\picture\',currentfilename));
%    currentimage5 = imresize(currentimage5, [144,176]);
%    currentimage =rgb2gray(currentimage);
%    imageMatrix(:,:,ii) = currentimage;
end
%images=cell2mat(images);
 %save(images,'var');

 function [img]=process(currentfolder)
    currentimage = imread(currentfolder);
    currentimage = double(currentimage);
    currentimage = imresize(currentimage, [144,176]);
    img = currentimage;

    
 
 end