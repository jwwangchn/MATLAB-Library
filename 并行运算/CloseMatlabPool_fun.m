function CloseMatlabPool_fun
%====================================================================
%�ر� MATLAB �������㣬�� StartMatlabPool_fun() �������ʹ�ã�ling��
%StartMatlabPool(size)

   poolobj = gcp('nocreate');
   delete(poolobj);
end