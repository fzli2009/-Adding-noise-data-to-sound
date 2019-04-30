function [y,noise] = add_noisefile(s,filepath_name,SNR,fs)
% s 指待加噪信号
% filepath_name 噪声文件路径
% SNR 信噪比
[wavin,fs1]=audioread(filepath_name);
if size(wavin,2)==2  %turn double channel to single channel
    wavin=wavin(:,1);
end
if fs1~=fs
    wavin=resample(wavin,fs,fs1);%尽量不要使用此函数做降采样
end
ns=length(s);                                    %求出s的长度
noise=wavin(1:ns);
noise=noise-mean(noise);                         %噪声去除直流分量
signal_power = 1/ns*sum(s.*s);                   %求出信号的平均能量
noise_power = 1/ns*sum(noise.*noise);            %求出噪声的能量
noise_variance = signal_power / ( 10^(SNR/10) ); %求出噪声指定的方差值
noise=sqrt(noise_variance/noise_power)*noise;    %调整噪声幅值
y=s+noise;                                       %构成带噪声音
end