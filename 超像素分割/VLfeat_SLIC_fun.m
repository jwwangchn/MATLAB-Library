function segments=VLfeat_SLIC_fun(im,regionsize,regularizer)
%====================================================================
%ʹ�� VLfeat ���д�� SLIC �����طָ����ling��
%segments = VLfeat_SLIC_fun(im, regionsize, regularizer)
%====================================================================
%���������
%   [1] im Ϊͼ�����
%   [2] regionsize Ϊ�����ؿ������С Ĭ��ֵΪ 200
%   [3] regularizer Ϊ Ĭ��ֵΪ 200
%====================================================================
%���������
%   [1] segments Ϊ�ָ�֮��ĳ����ؿ�ı�ǩ
%   [2] numlabels Ϊ����������
%====================================================================
%   ����������֮�� ��ʾ�ָ�֮���ͼ�� �����ָ�֮���ͼ��д�� image_VLfeat_SLIC.jpg �ļ���

%% ����Ĭ��ֵ�趨����
if nargin==0
    im=imread('coloredChips.png');
    regionsize = 200;     %SuperpixelsNumĬ��ֵΪ200
    regularizer = 200;   %CompactnessFactorĬ��ֵΪ200
elseif nargin==1
    regionsize = 200;     %SuperpixelsNumĬ��ֵΪ200
    regularizer = 200;   %CompactnessFactorĬ��ֵΪ200
end

%%
[a,b,h]=size(im);

segments=vl_slic(single(im),regionsize,regularizer);

% overaly segmentation
[sx,sy]=vl_grad(double(segments), 'type', 'forward') ;
s = find(sx | sy) ;
imp = im ;
imp([s s+numel(im(:,:,1)) s+2*numel(im(:,:,1))]) = 0 ;
[m,n,k]=size(imp)
for a=1:m
    for b=1:n
        if imp(a,b,1)==0
            imp(a,b,1)=255;
            imp(a,b,2)=0;
            imp(a,b,3)=0;
        end
    end
end
figure
imshow(imp)
imwrite(imp,'image_VLfeat_SLIC.jpg');
