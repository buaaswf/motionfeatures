close all  
clear  
clc  
  
%% ��ʾһ��͸��ͼ��  
[I,map,alpha] = imread('C:\Users\Song Dafeng\Desktop\a12.png');  
alpha=0.1;
h = imshow(I);  
set(h,'AlphaData',alpha)  
  
  
imwrite(I,'tranOut.png','Alpha',h); %����͸��ͼ��  
  
pause(2)  
%% ������ʾ��һ��͸��ͼ����ʾû�����⣬����copy���������������⣡����  
% һ�ֿ��еĽ��������ֱ���ڳ���������������ͼ���alphaͨ�����ٱ��棬����Ͳ�д��  
hold on  
h2=imshow(I,'XData',[100, 100-1+size(I,2)],'YData',[130,130-1+size(I,1)]);  
set(h2,'AlphaData',alpha)    

axis on  
axis tight  
% axis xy %��תy�᷽��  
  
set(gca,'color','none')  %����axis��ͼ�ı���Ϊ͸���ģ�����ʾ����figure�ı���ɫ��  
saveas(gcf,'outAll.png')  