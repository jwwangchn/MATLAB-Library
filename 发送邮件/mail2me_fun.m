function mail2me_fun(subject,content) 
%====================================================================
%���ʼ��ĳ���ling��
%mail2me_fun(subject,content)
%====================================================================
%���������
%   [1] subject(string) Ϊ�ʼ�����
%   [2] content(string) Ϊ�ʼ�����

%% ����Ĭ��ֵ�趨����
if nargin==0
    subject = '����������ϣ�';
    content = '��鿴�����';
end
%%
MailAddress = '18368917465@163.com'; 
password = 'APTX4869';   
setpref('Internet','E_mail',MailAddress); 
setpref('Internet','SMTP_Server','smtp.163.com'); 
setpref('Internet','SMTP_Username',MailAddress); 
setpref('Internet','SMTP_Password',password); 
props = java.lang.System.getProperties; 
props.setProperty('mail.smtp.auth','true'); 
sendmail('jwwang12@lzu.edu.cn',subject,content); 
display('����������ϣ��ʼ����ͳɹ���');
end