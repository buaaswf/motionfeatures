close all  
clear  
clc  
  
%% 显示一幅透明图像  
[I,map,alpha] = imread('C:\Users\Song Dafeng\Desktop\a12.png');  
alpha=0.1;
h = imshow(I);  
set(h,'AlphaData',alpha)  
  
  
imwrite(I,'tranOut.png','Alpha',h); %保存透明图像  
  
pause(2)  
%% 叠加显示另一幅透明图像，显示没有问题，但是copy到其他程序有问题！！！  
% 一种可行的解决方法是直接在程序里生成完整的图像和alpha通道，再保存，这里就不写了  
hold on  
h2=imshow(I,'XData',[100, 100-1+size(I,2)],'YData',[130,130-1+size(I,1)]);  
set(h2,'AlphaData',alpha)    

axis on  
axis tight  
% axis xy %翻转y轴方向  
  
set(gca,'color','none')  %设置axis绘图的背景为透明的（即显示所在figure的背景色）  
saveas(gcf,'outAll.png')  