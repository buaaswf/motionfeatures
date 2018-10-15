%load hall1-200; 
%load outputpwrcrop;
%load outputpwrcropnames;
% load outputpwrgallery;
% load outputpwrgallerynames;
%load outputpwrtrainall;
%load outputpwrtrainallnames;
% load outputpwr;
% load outputpwrnames;
load visdrone;
load visdronenames;
%%%%%%%%%%%%%%%%%%%%
% randomRowIdxs = randperm(11816);
% resultExample1 = imageMatrix(:,:,randomRowIdxs);
% randomimagefiles=imagefiles(randomRowIdxs,:);
% imageMatrix=resultExample1;
% imagefiles=randomimagefiles;
%%%%%%%%%%%%%%%%%%%%
% %load outputmars;
% %outputpath = 'MARS';
% outputpath ='PRWgallerycrop5';
% load 1_prwoutput;
% load 1_prwoutputnames;
%load outputmars;
%outputpath = 'MARS';
kk=100;
% outputpath ='randomoutputpwrtrainall20k';
% outputpath ='crop100';
outputpath ='visdrone';
outputpath ='visdrone100';
singlelen = uint32(size(imageMatrix,3)/kk);
imageMatrixori = imageMatrix;
orisize=[1080,1920];
%orisize =[144,176];
test=(size(imageMatrix,3)/kk);
%for k=1:(size(imageMatrix,3)/kk)
for k=1:kk
    start = (k-1)*singlelen+1;
    send = k*singlelen;
    imageMatrix = imageMatrixori(:,:,start:send);

    imageMatrix = reshape(imageMatrix,[],singlelen);
    imageMatrix = im2double(imageMatrix);

    isize=[144,176];
    [L,S,G,RMSE,error]=SSBackgroundswf(imageMatrix,1,0,0,isize);

    X=imageMatrix;
    mkdir(fullfile(outputpath,'LL'));
    mkdir(fullfile(outputpath,'SS'));
    mkdir(fullfile(outputpath,'GG'));
    save(fullfile(outputpath,strcat(num2str(k),'_Lowrank.mat')),'L'); 
    save(fullfile(outputpath,strcat(num2str(k),'_Sparse.mat')),'S'); 


    for i=1:min([200000,size(X,2)])
        LL=reshape(L(:,i),isize);
        LL=uint8(255 * mat2gray(LL));
        fileid=split(imagefiles(start+i-1).folder,'\');
        fileid(end)
        diroutLL=fullfile(outputpath,'LL',fileid(end));
        mkdir(diroutLL{1});
        imwrite(LL,fullfile(diroutLL{1},imagefiles(start+i-1).name));

        SS=reshape(S(:,i),isize);
        SS=uint8(255 * mat2gray(SS));
        diroutSS=fullfile(outputpath,'SS',fileid(5))
        mkdir(diroutSS{1});
        SS = imresize(SS,orisize );
        imwrite(SS,fullfile(diroutSS{1},imagefiles(start+i-1).name));

        GG= reshape(G(:,i),isize);
        GG=uint8(255 * mat2gray(GG));
        diroutGG=fullfile(outputpath,'GG',fileid(5))
        mkdir(diroutGG{1});
        imwrite(GG,fullfile(diroutGG{1},imagefiles(start+i-1).name));
    end

end
imageMatrix = imageMatrixori;
start = size(imageMatrix,3)-mod(size(imageMatrix,3),100)+1;
send = size(imageMatrix,3);
imageMatrix = imageMatrix(:,:,start:send);
    

imageMatrix = reshape(imageMatrix,[],send-start+1);
imageMatrix = im2double(imageMatrix);
isize=[144,176];
[L,S,G,RMSE,error]=SSBackgroundswf(imageMatrix,2,0,0,isize);

X=imageMatrix;

save(fullfile(outputpath,strcat(num2str(start),'_Lowrank.mat')),'L'); 
save(fullfile(outputpath,strcat(num2str(start),'_Sparse.mat')),'S'); 
mkdir(fullfile(outputpath,'LL'));
mkdir(fullfile(outputpath,'SS'));
mkdir(fullfile(outputpath,'GG'));
for i=1:min([200,size(X,2)])
    LL=reshape(L(:,i),isize);

    imwrite(LL,fullfile(outputpath,'LL',imagefiles(start+i-1).name));
    SS=reshape(S(:,i),isize);
    SS=uint8(255 * mat2gray(SS));
    SS = imresize(SS,orisize );
    imwrite(SS,fullfile(outputpath,'SS',imagefiles(start+i-1).name));
    GG= reshape(G(:,i),isize);
    imwrite(GG,fullfile(outputpath,'GG',imagefiles(start+i-1).name));
    LL=reshape(L(:,i),isize);
    fileid=split(imagefiles(start+i-1).folder,'\');

    diroutLL=fullfile(outputpath,'LL',fileid(5));
    mkdir(diroutLL{1});
    imwrite(LL,fullfile(diroutLL{1},imagefiles(start+i-1).name));

    SS=reshape(S(:,i),isize);
    SS=uint8(255 * mat2gray(SS));
    diroutSS=fullfile(outputpath,'SS',fileid(5))
    mkdir(diroutSS{1});
    SS = imresize(SS,orisize );
    imwrite(SS,fullfile(diroutSS{1},imagefiles(start+i-1).name));

    GG= reshape(G(:,i),isize);
    diroutGG=fullfile(outputpath,'GG',fileid(5))
    mkdir(diroutGG{1});
    imwrite(GG,fullfile(diroutGG{1},imagefiles(start+i-1).name));
end

