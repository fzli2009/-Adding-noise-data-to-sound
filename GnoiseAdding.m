clc;clear all;close all;
% 用白噪声测试加噪程序
fs = 44100;
tmax = 1;
t = 0:1/fs:tmax;
% Gnoise = randn(length(t),1);
% Gnoise = Gnoise./max(abs(Gnoise));
% audiowrite('E:\Experiment\周二会议\第九周会议\Gnoise_41K.wav',Gnoise,fs)


noise_path = 'E:\Experiment\周二会议\第九周会议\Gnoise_41K.wav';
sound_path = 'E:\Experiment\周二会议\第九周会议\sweep_20K_44.1K.wav';
[signal,fs] = audioread(sound_path);
[y,noise] = add_noisefile(signal,noise_path,0,fs);
% y_normal = y./max(abs(y));
% audiowrite('E:\Experiment\周二会议\第九周会议\sweep_addGnoise.wav',y_normal,fs)
figure(1)
subplot(3,1,1)
plot(t,signal)
title('0-20KHz扫频声信号时域波形')
xlabel('时间s')
ylabel('归一化幅值')
text(0.85,3,strcat('平均能量：',num2str(sum(signal.*signal)/length(signal))))
ylim([-4 4])

subplot(3,1,2)
plot(t,noise)
title('高斯白噪声时域波形')
xlabel('时间s')
ylabel('幅值')
text(0.85,3,strcat('平均能量：',num2str(sum(noise.*noise)/length(noise))))
ylim([-4 4])

subplot(3,1,3)
plot(t,y)
title('叠加0dB高斯白噪声后扫频声信号的时域波形')
xlabel('时间s')




ylabel('幅值')
text(0.85,3,strcat('平均能量：',num2str(sum(y.*y)/length(y))))
ylim([-4 4])

figure(2)
subplot(3,1,1)
spectrogram(signal,1024,512,1024,fs)
title('扫频声信号的频谱图')
subplot(3,1,2)
spectrogram(noise,1024,512,1024,fs)
title('高斯白噪声的频谱图')
subplot(3,1,3)
spectrogram(y,1024,512,1024,fs)
title('叠加0dB的高斯白噪声后的扫频声信号频谱图')

