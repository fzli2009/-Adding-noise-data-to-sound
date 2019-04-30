clc;clear all;close all;
% �ð��������Լ������
fs = 44100;
tmax = 1;
t = 0:1/fs:tmax;
% Gnoise = randn(length(t),1);
% Gnoise = Gnoise./max(abs(Gnoise));
% audiowrite('E:\Experiment\�ܶ�����\�ھ��ܻ���\Gnoise_41K.wav',Gnoise,fs)


noise_path = 'E:\Experiment\�ܶ�����\�ھ��ܻ���\Gnoise_41K.wav';
sound_path = 'E:\Experiment\�ܶ�����\�ھ��ܻ���\sweep_20K_44.1K.wav';
[signal,fs] = audioread(sound_path);
[y,noise] = add_noisefile(signal,noise_path,0,fs);
% y_normal = y./max(abs(y));
% audiowrite('E:\Experiment\�ܶ�����\�ھ��ܻ���\sweep_addGnoise.wav',y_normal,fs)
figure(1)
subplot(3,1,1)
plot(t,signal)
title('0-20KHzɨƵ���ź�ʱ����')
xlabel('ʱ��s')
ylabel('��һ����ֵ')
text(0.85,3,strcat('ƽ��������',num2str(sum(signal.*signal)/length(signal))))
ylim([-4 4])

subplot(3,1,2)
plot(t,noise)
title('��˹������ʱ����')
xlabel('ʱ��s')
ylabel('��ֵ')
text(0.85,3,strcat('ƽ��������',num2str(sum(noise.*noise)/length(noise))))
ylim([-4 4])

subplot(3,1,3)
plot(t,y)
title('����0dB��˹��������ɨƵ���źŵ�ʱ����')
xlabel('ʱ��s')




ylabel('��ֵ')
text(0.85,3,strcat('ƽ��������',num2str(sum(y.*y)/length(y))))
ylim([-4 4])

figure(2)
subplot(3,1,1)
spectrogram(signal,1024,512,1024,fs)
title('ɨƵ���źŵ�Ƶ��ͼ')
subplot(3,1,2)
spectrogram(noise,1024,512,1024,fs)
title('��˹��������Ƶ��ͼ')
subplot(3,1,3)
spectrogram(y,1024,512,1024,fs)
title('����0dB�ĸ�˹���������ɨƵ���ź�Ƶ��ͼ')

