function [segments, numlabels]=mex_SLIC_fun(im, SuperpixelsNum, CompactnessFactor)
%====================================================================
%ʹ�� SLIC �� C Դ������д�� SLIC �����طָ����ling��
%[segments, numlabels] = VLfeat_SLIC_fun(im, regionsize, regularizer)
%====================================================================
%���������
%   [1] im Ϊͼ�����
%   [2] SuperpixelsNum Ϊ���������� Ĭ��ֵΪ 150
%   [3] CompactnessFactor Ϊ���ܶ� Ĭ��ֵΪ 20
%====================================================================
%���������
%   [1] segments Ϊ�ָ�֮��ĳ����ؿ�ı�ǩ
%   [2] numlabels Ϊ����������
%====================================================================
%   ����������֮�� ��ʾ�ָ�֮���ͼ�� �����ָ�֮���ͼ��д�� image_mex_SLIC.jpg �ļ���

%% ����Ĭ��ֵ�趨����
if nargin==0
    im=imread('coloredChips.png');
    SuperpixelsNum=150;     %SuperpixelsNumĬ��ֵΪ150
    CompactnessFactor=20;   %CompactnessFactorĬ��ֵΪ20
elseif nargin==1
    SuperpixelsNum=150;     %SuperpixelsNumĬ��ֵΪ150
    CompactnessFactor=20;   %CompactnessFactorĬ��ֵΪ20
end

%%
[segments, numlabels] = slicmex(im,SuperpixelsNum,CompactnessFactor);%numlabels is the same as number of superpixels
% imagesc(labels);
%����ע�Ͳ��ֲ������ô��룬���ǽϴֵķָ��ߴ��룡����
% [a,b,h]=size(im);
% for m=1:a
%     for n=1:b
%         if (m==1)||(n==1)||(m==a)||(n==b)
%             im(m,n)=im(m,n);
%         elseif (segments(m,n)~=segments(m-1,n)||segments(m,n)~=segments(m+1,n)||segments(m,n)~=segments(m,n-1)||segments(m,n)~=segments(m,n+1))
%             im(m,n,1)=255;
%             im(m,n,2)=0;
%             im(m,n,3)=0;
%         end
%     end
% end


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

%���ָ���ת���ɰ�ɫ
imp=segment_line_red2other(imp);
figure
imshow(imp);

imwrite(imp,'image_mex_SLIC_3.jpg');

end