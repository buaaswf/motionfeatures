clc; clear all; close all;

filename = 'F:\reid\NMB\1.mp4';

xyloObj = VideoReader(filename);

nFrames = xyloObj.NumberOfFrames;

vidHeight = xyloObj.Height;

vidWidth = xyloObj.Width;





for k = 1 : nFrames

    im = read(xyloObj, k);%读取第k帧，存入im中

    imwrite(im, ['original_frame',num2str(k),'.bmp'], 'bmp');%把im存储成图片，并且存储的文件名根据序号改变

end

