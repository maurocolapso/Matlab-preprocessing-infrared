%% Plot Script for FTIR data from different mosquito body parts

% Import data 
tic %starts stopwatch timer

inputuser = input('Mosquito and age part? ','s')

mozziename = inputuser

%%  Head 
mozziename = '*1D-HE*.dpt'; 
[Y, MZ] = importIRfiles(mozziename);
Y1d_mean = mean(Y,2);

mozziename = '*3D-HE*.dpt'; 
Y = importIRfiles(mozziename);
Y3d_mean = mean(Y,2);

mozziename = '*12D-HE*.dpt'; 
Y = importIRfiles(mozziename);
Y12d_mean = mean(Y,2);


%Plot 
plot(MZ,Y1d_mean,'b');
hold on
plot(MZ,Y3d_mean,'r')
plot(MZ,Y12d_mean,'Color',[0 0.5 0])
set(gca, 'XDir','reverse')
title('Mean Spectra of Heads')
xlabel('Wavenumbers (cm -1)') 
ylabel('Absorbance (a.u)')
legend('1 day old','3 days old','12 days old')
hold off



%% Thorax
mozziename = '*1D-TH*.dpt'; 
[Y,MZ] = importIRfiles(mozziename);
Yt1d_mean = mean(Y,2);

mozziename = '*3D-TH*.dpt'; 
Y = importIRfiles(mozziename);
Yt3d_mean = mean(Y,2);

mozziename = '*12D-TH*.dpt'; 
Y = importIRfiles(mozziename);
Yt12d_mean = mean(Y,2);

% Plot
%Plot 
plot(MZ,Yt1d_mean,'b');
hold on
plot(MZ,Yt3d_mean,'r')
plot(MZ,Yt12d_mean,'Color',[0 0.5 0])
set(gca, 'XDir','reverse')
title('Mean Spectra of Thorax')
xlabel('Wavenumbers (cm -1)') 
ylabel('Absorbance (a.u)')
legend('1 day old','3 days old','12 days old')
hold off

%% Abodmen

mozziename = '*1D-AB*.dpt'; 
[Y,MZ] = importIRfiles(mozziename);
Ya1d_mean = mean(Y,2);

mozziename = '*3D-AB*.dpt'; 
Y = importIRfiles(mozziename);
Ya3d_mean = mean(Y,2);

mozziename = '*12D-AB*.dpt'; 
Y = importIRfiles(mozziename);
Ya12d_mean = mean(Y,2);

%Plot 
plot(MZ,Ya1d_mean,'b')
hold on
plot(MZ,Ya3d_mean,'r')
plot(MZ,Ya12d_mean,'Color',[0 0.5 0])
set(gca, 'XDir','reverse')
title('Mean Spectra of Abodmen')
xlabel('Wavenumbers (cm -1)') 
ylabel('Absorbance (a.u)')
legend('1 day old','3 days old','12 days old')
hold off

%% Legs

mozziename = '*1D-LG*.dpt'; 
[Y,MZ] = importIRfiles(mozziename);
Yl1d_mean = mean(Y,2);

mozziename = '*3D-LG*.dpt'; 
[Y,MZ] = importIRfiles(mozziename);
Yl3d_mean = mean(Y,2);

mozziename = '*12D-LG*.dpt'; 
[Y,MZ] = importIRfiles(mozziename);
Yl12d_mean = mean(Y,2);

%Plot 
plot(MZ,Yl1d_mean,'b')
hold on
plot(MZ,Yl3d_mean,'r')
plot(MZ,Yl12d_mean,'Color',[0 0.5 0])
set(gca, 'XDir','reverse')
title('Mean Spectra of Legs')
xlabel('Wavenumbers (cm -1)') 
ylabel('Absorbance (a.u)')
legend('1 day old','3 days old','12 days old')
hold off

%% unifed Plot  

figure
set(gcf,'position',[ 100 400 800 1600], 'Color','w') %is the lower left corner, Lenght and Width 

% head
ax = subplot(4,1,1)
plot1 = plot(ax,MZ,Y1d_mean,'b')
xlim([600 4000])
box off
hold on
plot2 = plot(MZ,Y3d_mean,'r')
plot3 = plot(MZ,Y12d_mean,'Color',[0 0.5 0])
set(gca, 'XDir','reverse')
title('Head')
hold off
% thorax
bx = subplot(4,1,2)
plot(bx,MZ,Yt1d_mean,'b')
xlim([600 4000])
box off
hold on
plot(MZ,Yt3d_mean,'r')
plot(MZ,Yt12d_mean,'Color',[0 0.5 0])
set(gca, 'XDir','reverse')
title('Thorax')
hold off
% abdomen
cx = subplot(4,1,3)
plot(cx,MZ,Ya1d_mean,'b')
xlim([600 4000])
box off
hold on
plot(MZ,Ya3d_mean,'r')
plot(MZ,Ya12d_mean,'Color',[0 0.5 0])
set(gca, 'XDir','reverse')
title('Abodmen')
hold off

dx = subplot(4,1,4)
plot(dx,MZ,Yl1d_mean,'b')
xlim([600 4000])
box off
hold on
plot(MZ,Yl3d_mean,'r')
plot(MZ,Yl12d_mean,'Color',[0 0.5 0])
set(gca, 'XDir','reverse')
title('Legs')
xlabel('Wavenumbers (cm -1)','Fontsize',8.0)
hold off

hL = legend([plot1,plot2,plot3],{'1 day old','3 days old','12 days old'},'Fontsize',8.0);





