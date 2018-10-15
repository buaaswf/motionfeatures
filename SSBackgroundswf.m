function [L,S,G,RMSE,error]=SSBackgroundswf(X,rank,tau,power,isize)

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%                 Background Modeling by Semi-Soft GoDec
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%isize: image size of each frame, for example, 1024x768
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%Tianyi Zhou, 2011, All rights reserved.

[L,S,RMSE,error]=SSGoDec(X,rank,tau,power);
%[L,S,RMSE,error]=GroupGoDec(X,rank,card,power,4);
G=X-L-S;
% save('Lowrank.mat','L'); 
% save('Sparse.mat','S'); 
% figure;
% for i=1:min([200,size(X,2)])
%     subplot(1,4,1);imagesc(reshape(X(:,i),isize));colormap(gray);axis image;axis off;title('X(Sample)');
%     
%     subplot(1,4,2);imagesc(reshape(L(:,i),isize));colormap(gray);axis image;axis off;title('L(Low-rank)');
%     LL=reshape(L(:,i),isize);     
%     %subplot(1,4,3);imagesc(reshape(X(:,i).*(~~S(:,i)),isize));colormap(gray);axis image;axis off;title('S(Sparse)');
%     subplot(1,4,3);imagesc(reshape(S(:,i),isize));colormap(gray);axis image;axis off;title('S(Sparse)');
%     SS=reshape(S(:,i),isize);
%     subplot(1,4,4);imagesc(reshape(G(:,i),isize));colormap(gray);axis image;axis off;title('G(Noise)');
%     GG= reshape(G(:,i),isize);
%     pause(0.1);
%     if i<10
%         print('-djpeg', '-r250', sprintf('%s%s','00',num2str(i)));
%     elseif i<100
%         print('-djpeg', '-r250', sprintf('%s%s','0',num2str(i)));
%     else
%         print('-djpeg', '-r250', sprintf('%s',num2str(i)));
%     end
% end
