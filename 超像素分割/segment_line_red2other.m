function disp_img=segment_line_red2other(disp_img)
%====================================================================
%���ָ��ߵ���ɫǿ��ת��Ϊ������ɫ��ling��
%disp_img=segment_line_red2other(disp_img)
%====================================================================
%���������
%   [1] disp_img Ϊͼ�����
%====================================================================
%���������
%   [1] disp_img Ϊת�����ͼ�����
%====================================================================

[img_length,img_width,deepth]=size(disp_img);

for k=1:img_length
    for m=1:img_width
        if(disp_img(k,m,1)==255 && disp_img(k,m,2)==0 && disp_img(k,m,3)==0)
            disp_img(k,m,2)=0;
            disp_img(k,m,3)=0;
            disp_img(k,m,1)=255;
        end
    end
end