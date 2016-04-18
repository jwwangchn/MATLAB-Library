function [image_mat,numlabels]=save_superpixel_fun(image,str1)
%====================================================================
%���� AdaBoost �㷨ѵ��ͼƬ��Ϣ�ĺ�����ling��
%make_train_matfile_fun(image_mat,numlabels,tree_label_init)
%====================================================================
%���������
%   [1] image_mat ��ѵ��ͼƬ�ָ�����ĳ����ؿ�ת�������������洢��һ��֮��ľ���ÿ��һ�������ؿ飩 ��
%   save_superpixel_fun ��������
%   [2] numlabels ���������� �� save_superpixel_fun ��������
%   [3] tree_label_init Ϊ�����ؿ��������ڳ����ؿ��������� ��ѵ�����ݵ�ԭʼ��ǩ
%====================================================================
%   ����������֮�� ��ѵ��ͼƬ������д�뵽 SLIC_train.mat �ļ���

%% [1] ��ȡ����ʾԭʼͼ��
% image = imread('�ܶ����.jpg');
% image = imread('coloredChips.png'); %����ͼ��
% image = imread('����ͼƬ.jpg');
figure
imshow(image);
[image_width,image_length,image_high]=size(image);
%% [2] ��˹�˲�����
%��ø�˹��ͨ�˲���,HSIZEΪ�˲�����С��SIGMAΪ����
HSIZE=400;
SIGMA=0.5;
%ȱʡΪ��0.5
H = fspecial('gaussian',HSIZE,SIGMA);
%��ͼ���˲�����imfilter����
Blurimage = imfilter(image,H,'replicate');

figure
imshow(Blurimage)
imwrite(Blurimage,'��˹�˲�.jpg')
%% [3] �����طָ�

[segments, numlabels] = mex_SLIC_fun(Blurimage,100,20);
numlabels=double(numlabels)

%���㵥�������ؿ�Ĵ�С
size_single_superpixel=(image_width*image_length/numlabels)^(1/2);

%% [4] ��ȡ���������ؿ�

for k=0:numlabels-1
    [row_0,col_0]=find(segments==k);
    min_row=min(row_0);
    min_col=min(col_0);
    clear image_temp
    for i=1:length(row_0)    
        image_temp(row_0(i)-min_row+1,col_0(i)-min_col+1,1)=Blurimage(row_0(i),col_0(i),1);
        image_temp(row_0(i)-min_row+1,col_0(i)-min_col+1,2)=Blurimage(row_0(i),col_0(i),2);
        image_temp(row_0(i)-min_row+1,col_0(i)-min_col+1,3)=Blurimage(row_0(i),col_0(i),3);
    end
    str=[str1,num2str(k) ,'.jpg'];                          %�����ؿ������ַ���
    
%     new_image_temp=imresize(image_temp,[fix(size_single_superpixel),fix(size_single_superpixel)],'bilinear'); %��ͼ������ز��� 50*50
    
    new_image_temp=imresize(image_temp,[100,100],'bilinear'); %��ͼ������ز��� 50*50
    imwrite(new_image_temp,str);
    
    %�����ݴ洢�� mat �ļ�
    image_mat_temp=rgb2gray(new_image_temp);%��3ά����ת��Ϊ2ά����
    image_mat_temp=im2double(image_mat_temp);%��������ת��Ϊdouble 
    image_mat_temp=image_mat_temp(:);
    image_mat(k+1,:)=image_mat_temp;
end
        
