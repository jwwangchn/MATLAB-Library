function make_train_matfile_fun(image_mat,numlabels,tree_label_init)
%====================================================================
%���� AdaBoost �㷨ѵ��ͼƬ��Ϣ .mat �ļ��ĺ�����ling��
%make_train_matfile_fun(image_mat,numlabels,tree_label_init)
%====================================================================
%���������
%   [1] image_mat ��ѵ��ͼƬ�ָ�����ĳ����ؿ�ת�������������洢��һ��֮��ľ���ÿ��һ�������ؿ飩 ��
%   save_superpixel_fun ��������
%   [2] numlabels ���������� �� save_superpixel_fun ��������
%   [3] tree_label_init Ϊ�����ؿ��������ڳ����ؿ��������� ��ѵ�����ݵ�ԭʼ��ǩ
%====================================================================
%   ����������֮�� ��ѵ��ͼƬ������д�뵽 SLIC_train.mat �ļ���

%% [5] �洢 .mat �ļ�
%����ѵ����ͼ������
train_image=image_mat(1:numlabels,:);

%���ı�ǩ
tree_label_temp=tree_label_init;
tree_label_temp=tree_label_temp+1;%��Ϊ�����ؿ�ı�ǩ�� 0 ��ʼ�����ԣ�ʵ�ʱ�ǩҪ�� 1

tree_label=ones(numlabels,1);
for k=1:length(tree_label_temp)
    tree_label(tree_label_temp(k))=0;%SVM�㷨��עΪ0��1
end

train_label=tree_label;
% table_label=table_label_Chip(1:numlabels);

% %���ڲ��Ե�����
% new_image=image_mat(1:numlabels,:);
% new_label=tree_label(1:numlabels);

save('SLIC_train.mat', 'train_image', 'train_label');
