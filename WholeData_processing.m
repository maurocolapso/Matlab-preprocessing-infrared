%% Plot Script for FTIR data from different mosquito body parts


% Import data 
tic %starts stopwatch timer

sample = importdata('01-AC-100-1D-RX-HE1.dpt'); 
MZ = sample(:,1); %create wavenumbers variable
z = size(MZ,1);

dinfo = dir ('*.dpt'); %read files in current directory with .dpt extension
files = {dinfo.name}; %create a cell array with the names of the files in the directory
a = length(files); %number of files to use in the for loop and number of files imported
Y = zeros(z, a); %preallocation of Y

for i = 1:a %loop extract every second column of each file and append into Y variable
    Y(:,i) = dlmread(files{i},'\t',0,1);
end

% number of spectras imported
formatSpec = 'Number of spectra files imported: %d',...);
sprintf(formatSpec,a)

% number of data points and wavenumber range
M = round(min(MZ));
N = round(max(MZ));
reso =  round((N-M)/z)

sprintf(['Number of files imported: %d.\nEach spectra file has '... 
    '%d data points.\nThe wavenumber '...
    'range is from %d cm-1 to %d cm-1.\nThe resolution is %d'],a,z,M,N,reso)


% Check if spectra has values of 6
[~,col] = find(Y == 6);
Y(:,col) = []; % erase those spectra

% Number of spectra removed
b = size(Y,2);
c = a - b;
formatSpec = 'Number of spectra removed: %d';
sprintf(formatSpec,c)

% Plot 
plot(MZ,Y)
grid
set(gca, 'XDir','reverse')
title('Mid Infrared Spectra of Mosquitoes')
xlabel('Wavenumbers (cm -1)') 
ylabel('Absorbance')


%% Choose region from 2000 to 600 cm-1

% Rows are 1036 to 1763

Y_short = Y(1036:1763,:);
MZ_short = MZ(1036:1763,:);


% Plot 
plot(MZ_short,Y_short)
xlim([600 2000])
grid
set(gca, 'XDir','reverse')
title('FTIR - Refelction mode')
xlabel('Wavenumbers (cm -1)') 
ylabel('Absorbance')

toc %ends stopwatch timer

%% Plot Thorax
dinfo = dir ('*TH*.dpt');
files = {dinfo.name}; %create a cell array with the names of the files in the directory
a = length(files); %number of files to use in the for loop
Ythrx = zeros(z, a); %preallocation of Y

for i = 1:a
    Ythrx(:,i) = dlmread(files{i},'\t',0,1);
end

% Check if spectra has values of 6
[~,col] = find(Ythrx == 6);
Ythrx(:,col) = []; % erase those spectra

%normalization%
%YNT = msnorm(MZ,Ythrx,'MAX',10);
%figure
%plot(MZ,YNT)
%grid
%set(gca, 'XDir','reverse')
%xlabel('Wavenumbers')
%ylabel('Absorbance')
%title('Normalized to the Maximum Peak')

%Plot
plot(MZ,Ythrx)
ylim([0 4.5])
grid
set(gca, 'XDir','reverse')
title(' Spectra of mosquito thorax')
xlabel('Wavenumbers (cm -1)') 
ylabel('Absorbance')

%% Abdomen

% Import abdomen data
dinfo = dir ('*AB*.dpt');
files = {dinfo.name}; %create a cell array with the names of the files in the directory
a = length(files); %number of files to use in the for loop
Yabdm = zeros(z, a); %preallocation of Y

for i = 1:a
    Yabdm(:,i) = dlmread(files{i},'\t',0,1);
end

% Check if spectra has values of 6
[~,col] = find(Yabdm == 6);
Yabdm(:,col) = []; % erase those spectra

% Plot
plot(MZ,Yabdm)
ylim([0 4.5])
grid
set(gca, 'XDir','reverse')
title('Spectra of mosquito abdomen')
xlabel('Wavenumbers (cm -1)') 
ylabel('Absorbance')

%% Head

% Importa Head data
dinfo = dir ('*HE*.dpt');
files = {dinfo.name}; %create a cell array with the names of the files in the directory
a = length(files); %number of files to use in the for loop
Yheads = zeros(z, a); %preallocation of Y

for i = 1:a
    Yheads(:,i) = dlmread(files{i},'\t',0,1);
end

% Check if spectra has values of 6
[~,col] = find(Yheads == 6);
Yheads(:,col) = []; % erase those spectra

% Plot
plot(MZ,Yheads)
ylim([0 4.5])
grid
set(gca, 'XDir','reverse')
title('Spectra of mosquito heads')
xlabel('Wavenumbers (cm -1)') 
ylabel('Absorbance')

%% Mean Spectra for each body part

% calculate the mean spectra of each body part
Yheads_mean = mean(Yheads,2);
Ythrx_mean = mean(Ythrx,2);
Yabdm_mean = mean(Yabdm,2);
YMeans=[Yheads_mean,Ythrx_mean,Yabdm_mean];

%Plot 
plot(MZ,Yheads_mean,'m')
hold on
plot(MZ,Ythrx_mean,'r')
plot(MZ,Yabdm_mean,'b')
grid
set(gca, 'XDir','reverse')
title('Mean Spectra of Mosquito Body Parts')
xlabel('Wavenumbers (cm -1)') 
ylabel('Absorbance (a.u)')
legend('Heads','Thorax','Abdomen')
hold off

%% By Age

% One day old
dinfo = dir ('*AC-100-1D*.dpt');
files = {dinfo.name}; %create a cell array with the names of the files in the directory
a = length(files); %number of files to use in the for loop
Y1d = zeros(z, a); %preallocation of Y

for i = 1:a
    Y1d(:,i) = dlmread(files{i},'\t',0,1);
end

% Check if spectra has values of 6
[~,col] = find(Y1d == 6);
Y1d(:,col) = []; % erase those spectra

% Twelve day old
dinfo = dir ('*AC-100-12D*.dpt');
z = size(MZ,1);
files = {dinfo.name}; %create a cell array with the names of the files in the directory
a = length(files); %number of files to use in the for loop
Y12d = zeros(z, a); %preallocation of Y

for i = 1:a
    Y12d(:,i) = dlmread(files{i},'\t',0,1);
end

% Check if spectra has values of 6
[~,col] = find(Y12d == 6);
Y12d(:,col) = []; % erase those spectra

% Plot
plot(MZ,Y12d,MZ,Y1d)
grid
set(gca, 'XDir','reverse')
title('Mid infrared Spectra of An. colluzi')
xlabel('Wavenumbers (cm -1)') 
ylabel('Absorbance')

% Mean Spectra for each age
% calculate the mean spectra of each age
Y1d_mean = mean(Y1d,2);
Y12d_mean = mean(Y12d,2);
Yage = [Y1d_mean,Y12d_mean];
Yage2 = Yage(1036:1763,:);
MZ_age = MZ(1036:1763,:);

%% Normalization by Peak Intensity

YN2 = msnorm(MZ_age,Yage2,'MAX',10); %Normalize peaks by ten 
figure
plot(MZ_age,YN2)
grid
set(gca, 'XDir','reverse')
xlabel('Wavenumbers')
ylabel('Absorbance')
title('Normalized to the Maximum Peak')

%%

% Plot
plot(MZ,Y1d_mean,'b')
hold on
plot(MZ,Y12d_mean,'r')
grid
set(gca, 'XDir','reverse')
title('Mean An. colluzzi Spectra by Age')
xlabel('Wavenumbers (cm -1)') 
ylabel('Absorbance')
legend('1 day old','12 day old')
hold off

%%
% Normalization by Peak Intensity
YN1 = msnorm(MZ,YMeans,'MAX',5); %Normalize peaks by ten 
figure
plot(MZ,YN1,['b','r'])
grid
set(gca, 'XDir','reverse')
xlabel('Wavenumbers')
ylabel('Absorbance')
legend('Yheads','Ythrx','Yabdm')
title('Normalized to the Maximum Peak')

%% Graphs of mosquito parts and point by point measurements

%Abdomen

dinfo = dir ('*06-AC-100-12D-RX-AB*.dpt');
files = {dinfo.name}; %create a cell array with the names of the files in the directory
a = length(files); %number of files to use in the for loop
Y_abdomen = zeros(z, a); %preallocation of Y

for i = 1:a
    Y_abdomen(:,i) = dlmread(files{i},'\t',0,1);
end

dinfo = dir ('*06-AC-100-12D-RX-HE*.dpt');
files = {dinfo.name}; %create a cell array with the names of the files in the directory
a = length(files); %number of files to use in the for loop
Y_head = zeros(z, a); %preallocation of Y

for i = 1:a
    Y_head(:,i) = dlmread(files{i},'\t',0,1);
end

dinfo = dir ('*06-AC-100-12D-RX-TH*.dpt');
files = {dinfo.name}; %create a cell array with the names of the files in the directory
a = length(files); %number of files to use in the for loop
Y_thorax = zeros(z, a); %preallocation of Y

for i = 1:a
    Y_thorax(:,i) = dlmread(files{i},'\t',0,1);
end

% calculate de meaning of each part of the mosquito

Y_head_mean = mean(Y_head,2);
Y_thorax_mean = mean(Y_thorax,2);
Y_abdomen_mean = mean(Y_abdomen,2);
Y_mosquitoparts = [Y_head_mean,Y_thorax_mean,Y_abdomen_mean];
%%
% Plot
plot(MZ,Y_head_mean, MZ,Y_thorax_mean,MZ,Y_abdomen_mean)
grid
set(gca, 'XDir','reverse')
title('Mid infrared Spectra of one mosquito An. colluzi')
xlabel('Wavenumbers (cm -1)') 
ylabel('Absorbance')
legend('Head','Thorax','Abdomen')
%%

% Plot
plot(MZ,Y_abdomen)
grid
set(gca, 'XDir','reverse')
title('Mid infrared Spectra of An. colluzi abdomen of different tergas')
ylim([1 4]);
xlabel('Wavenumbers (cm -1)') 
ylabel('Absorbance')
legend({'a','b','c','d','f','g','h','i','j'})

%%
% Twelve day old
dinfo = dir ('*AC-100-12D*.dpt');
z = size(MZ,1);
files = {dinfo.name}; %create a cell array with the names of the files in the directory
a = length(files); %number of files to use in the for loop
Y12d = zeros(z, a); %preallocation of Y

for i = 1:a
    Y12d(:,i) = dlmread(files{i},'\t',0,1);
end

% Check if spectra has values of 6
[~,col] = find(Y12d == 6);
Y12d(:,col) = []; % erase those spectra

% Plot
plot(MZ,Y12d,MZ,Y1d)
grid
set(gca, 'XDir','reverse')
title('Mid infrared Spectra of An. colluzi')
xlabel('Wavenumbers (cm -1)') 
ylabel('Absorbance')

% Mean Spectra for each age
% calculate the mean spectra of each age
Y1d_mean = mean(Y1d,2);
Y12d_mean = mean(Y12d,2);
Yage = [Y1d_mean,Y12d_mean];
Yage2 = Yage(1036:1763,:);
MZ_age = MZ(1036:1763,:);

%% Normalization by Peak Intensity

YN2 = msnorm(MZ_age,Yage2,'MAX',10); %Normalize peaks by ten 
figure
plot(MZ_age,YN2)
grid
set(gca, 'XDir','reverse')
xlabel('Wavenumbers')
ylabel('Absorbance')
title('Normalized to the Maximum Peak')



