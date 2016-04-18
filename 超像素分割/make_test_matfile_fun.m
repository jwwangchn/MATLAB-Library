function make_test_matfile_fun(image_mat,numlabels,tree_label_init)
%====================================================================
%���� AdaBoost �㷨����ͼƬ��Ϣ .mat �ļ��ĺ�����ling��
%make_test_matfile_fun(image_mat,numlabels,tree_label_init)
%====================================================================
%���������
%   [1] image_mat ������ͼƬ�ָ�����ĳ����ؿ�ת�������������洢��һ��֮��ľ���ÿ��һ�������ؿ飩 ��
%   save_superpixel_fun ��������
%   [2] numlabels ���������� �� save_superpixel_fun ��������
%   [3] tree_label_init Ϊ�����ؿ��������ڳ����ؿ��������� ���������ݵ�ԭʼ��ǩ �������ݿ���û�б�ǩ
%====================================================================
%   ����������֮�� ������ͼƬ������д�뵽 SLIC_test.mat �ļ���

%% ����Ĭ��ֵ�趨����
if nargin==2
    tree_label_init=ones(numlabels,1);
end

%% [5] �洢 .mat �ļ�
%����ѵ��������
test_image=image_mat(1:numlabels,:);

%���ı�ǩ
tree_label_temp=tree_label_init;
tree_label_temp=tree_label_temp+1;
tree_label=ones(numlabels,1);
for k=1:length(tree_label_temp)
    tree_label(tree_label_temp(k))=0;%SVM�㷨��עΪ0��1
end

test_label=tree_label;

% %���ڲ��Ե�����
% new_image=image_mat(1:numlabels,:);
% new_label=tree_label(1:numlabels);

save('SLIC_test.mat', 'test_image', 'test_label');
