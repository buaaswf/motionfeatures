clc; clear all; close all;

filename = 'F:\reid\NMB\1.mp4';

xyloObj = VideoReader(filename);

nFrames = xyloObj.NumberOfFrames;

vidHeight = xyloObj.Height;

vidWidth = xyloObj.Width;





for k = 1 : nFrames

    im = read(xyloObj, k);%��ȡ��k֡������im��

    imwrite(im, ['original_frame',num2str(k),'.bmp'], 'bmp');%��im�洢��ͼƬ�����Ҵ洢���ļ���������Ÿı�

end

