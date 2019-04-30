function [y,noise] = add_noisefile(s,filepath_name,SNR,fs)
% s ָ�������ź�
% filepath_name �����ļ�·��
% SNR �����
[wavin,fs1]=audioread(filepath_name);
if size(wavin,2)==2  %turn double channel to single channel
    wavin=wavin(:,1);
end
if fs1~=fs
    wavin=resample(wavin,fs,fs1);%������Ҫʹ�ô˺�����������
end
ns=length(s);                                    %���s�ĳ���
noise=wavin(1:ns);
noise=noise-mean(noise);                         %����ȥ��ֱ������
signal_power = 1/ns*sum(s.*s);                   %����źŵ�ƽ������
noise_power = 1/ns*sum(noise.*noise);            %�������������
noise_variance = signal_power / ( 10^(SNR/10) ); %�������ָ���ķ���ֵ
noise=sqrt(noise_variance/noise_power)*noise;    %����������ֵ
y=s+noise;                                       %���ɴ�������
end