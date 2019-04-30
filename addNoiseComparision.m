clc;clear all;close all
format long
% �Ƚ����ּ������Ĳ�ͬ
sound_path = 'E:\Experiment\�ܶ�����\�ھ��ܻ���\glass.wav';
noise_path = 'E:\Experiment\�ܶ�����\Noise2.wav';
[s,fs] = audioread(sound_path);
s = s - mean(s); %����ֱ������
% s = s/max(abs(s)); %��ֵ��һ��
N = length(s);
time = (0:N-1)/fs;

%% ����add_noisefile�������
figure(1)
subplot(3,1,1)
plot(time,s,'k')
xlabel('ʱ��s')
ylabel('��һ����ֵ')
ylim([-1 1])
title('����������ʱ����')
set(gca,'FontSize',14);
text(1.2,0.5,strcat('ƽ������:',num2str(sum(s.*s)/length(s))),'FontSize',16)
grid on

[y,noise] = add_noisefile(s,noise_path,0,fs);%������Ƭ�����ָ������ȵ�����
subplot(3,1,3)
plot(time,y);
title('����0dB������������������ʱ����')
xlabel('ʱ��s')
ylabel('����ֵ')
set(gca,'FontSize',14);
text(1.2,0.5,strcat('ƽ������:',num2str(sum(y.*y)/length(y))),'FontSize',16)
ylim([-1 1])
grid on

subplot(3,1,2)
plot(time,noise);
title('����������ʱ����')
xlabel('ʱ��s')
ylabel('����ֵ')
set(gca,'FontSize',14);
text(1.2,0.5,strcat('ƽ������:',num2str(sum(noise.*noise)/length(noise))),'FontSize',16)
ylim([-1 1])
grid on
% audiowrite('E:\Experiment\�ܶ�����\�ھ��ܻ���\���������֤\noise_snr0.wav',noise,fs)
% audiowrite('E:\Experiment\�ܶ�����\�ھ��ܻ���\���������֤\glass_snr0.wav',y,fs)

disp('************�����ķָ���****************')
%% ���-10dB��������
figure(2)
subplot(3,1,1)
plot(time,s,'k')
xlabel('ʱ��s')
ylabel('��һ����ֵ')
ylim([-1 1])
title('����������ʱ����')
set(gca,'FontSize',14);
text(1.2,1,strcat('ƽ������:',num2str(sum(s.*s)/length(s))),'FontSize',16)
grid on

[y10,noise10] = add_noisefile(s,noise_path,-10,fs);%������Ƭ�����ָ������ȵ�����
subplot(3,1,3)
plot(time,y10);
title('����-10dB������������������ʱ����')
xlabel('ʱ��s')
ylabel('����ֵ')
set(gca,'FontSize',14);
text(1.2,1,strcat('ƽ������:',num2str(sum(y10.*y10)/length(y10))),'FontSize',16)
ylim([-1 1])
grid on

subplot(3,1,2)
plot(time,noise10);
title('����������ʱ����')
xlabel('ʱ��s')
ylabel('����ֵ')
set(gca,'FontSize',14);
text(1.2,1,strcat('ƽ������:',num2str(sum(noise10.*noise10)/length(noise10))),'FontSize',16)
ylim([-1 1])
grid on


% audiowrite('E:\Experiment\�ܶ�����\�ھ��ܻ���\noise_snrneg10.wav',noise10,fs)
% audiowrite('E:\Experiment\�ܶ�����\�ھ��ܻ���\glass_snrneg10.wav',y10,fs)


figure(3)
subplot(3,1,1)
spectrogram(s,512,256,512,fs)
set(gca,'FontSize',14);
title('����������Ƶ��ͼ')
subplot(3,1,2)
spectrogram(noise,512,256,512,fs)
set(gca,'FontSize',14);
title('����Ƶ��ͼ')
subplot(3,1,3)
spectrogram(y,512,256,512,fs)
set(gca,'FontSize',14);
title('��0dB�������Ƶ��ͼ')
%% ֮ǰadd_noisem�������
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

