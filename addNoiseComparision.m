clc;clear all;close all
format long
% 比较两种加噪程序的不同
sound_path = 'E:\Experiment\周二会议\第九周会议\glass.wav';
noise_path = 'E:\Experiment\周二会议\Noise2.wav';
[s,fs] = audioread(sound_path);
s = s - mean(s); %消除直流分量
% s = s/max(abs(s)); %幅值归一化
N = length(s);
time = (0:N-1)/fs;

%% 书中add_noisefile加噪程序
figure(1)
subplot(3,1,1)
plot(time,s,'k')
xlabel('时间s')
ylabel('归一化幅值')
ylim([-1 1])
title('玻璃破碎声时域波形')
set(gca,'FontSize',14);
text(1.2,0.5,strcat('平均能量:',num2str(sum(s.*s)/length(s))),'FontSize',16)
grid on

[y,noise] = add_noisefile(s,noise_path,0,fs);%给声音片段添加指定信噪比的噪声
subplot(3,1,3)
plot(time,y);
title('加噪0dB背景噪声后玻璃破碎声时域波形')
xlabel('时间s')
ylabel('幅度值')
set(gca,'FontSize',14);
text(1.2,0.5,strcat('平均能量:',num2str(sum(y.*y)/length(y))),'FontSize',16)
ylim([-1 1])
grid on

subplot(3,1,2)
plot(time,noise);
title('背景噪声的时域波形')
xlabel('时间s')
ylabel('幅度值')
set(gca,'FontSize',14);
text(1.2,0.5,strcat('平均能量:',num2str(sum(noise.*noise)/length(noise))),'FontSize',16)
ylim([-1 1])
grid on
% audiowrite('E:\Experiment\周二会议\第九周会议\加噪程序验证\noise_snr0.wav',noise,fs)
% audiowrite('E:\Experiment\周二会议\第九周会议\加噪程序验证\glass_snr0.wav',y,fs)

disp('************华丽的分割线****************')
%% 添加-10dB背景噪声
figure(2)
subplot(3,1,1)
plot(time,s,'k')
xlabel('时间s')
ylabel('归一化幅值')
ylim([-1 1])
title('玻璃破碎声时域波形')
set(gca,'FontSize',14);
text(1.2,1,strcat('平均能量:',num2str(sum(s.*s)/length(s))),'FontSize',16)
grid on

[y10,noise10] = add_noisefile(s,noise_path,-10,fs);%给声音片段添加指定信噪比的噪声
subplot(3,1,3)
plot(time,y10);
title('加噪-10dB背景噪声后玻璃破碎声时域波形')
xlabel('时间s')
ylabel('幅度值')
set(gca,'FontSize',14);
text(1.2,1,strcat('平均能量:',num2str(sum(y10.*y10)/length(y10))),'FontSize',16)
ylim([-1 1])
grid on

subplot(3,1,2)
plot(time,noise10);
title('背景噪声的时域波形')
xlabel('时间s')
ylabel('幅度值')
set(gca,'FontSize',14);
text(1.2,1,strcat('平均能量:',num2str(sum(noise10.*noise10)/length(noise10))),'FontSize',16)
ylim([-1 1])
grid on


% audiowrite('E:\Experiment\周二会议\第九周会议\noise_snrneg10.wav',noise10,fs)
% audiowrite('E:\Experiment\周二会议\第九周会议\glass_snrneg10.wav',y10,fs)


figure(3)
subplot(3,1,1)
spectrogram(s,512,256,512,fs)
set(gca,'FontSize',14);
title('玻璃破碎声频谱图')
subplot(3,1,2)
spectrogram(noise,512,256,512,fs)
set(gca,'FontSize',14);
title('噪声频谱图')
subplot(3,1,3)
spectrogram(y,512,256,512,fs)
set(gca,'FontSize',14);
title('加0dB噪声后的频谱图')
%% 之前add_noisem加噪程序
% figure(2)
% subplot(3,1,1)
% plot(time,s,'k')
% ylim([-1 1])
% [y2,noise2] = add_noisem(s,noise_path,0,fs);
% sum(y2.*y2)/length(y2)
% sum(s.*s)/length(s)
% sum(noise2.*noise2)/length(noise2)
% subplot(3,1,2)
% plot(time,y2);
% ylim([-1 1])
% subplot(3,1,3)
% plot(time,noise2);
% ylim([-1 1])

