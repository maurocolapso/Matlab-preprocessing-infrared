% import data
sample = importdata('04-AK-12D-WG1.dpt'); 
MZ = sample(:,1); %create wavenumbers variable
z = size(MZ,1);

plot(MZ, Ywings)

dinfo = dir ('*WG*.dpt'); %read files in current directory with .dpt extension
files = {dinfo.name}; %create a cell array with the names of the files in the directory
a = length(files); %number of files to use in the for loop
Ywings = zeros(z, a); %preallocation of Y

for i = 1:a %loop extract every second column of each file and append into Y variable
    Ywings(:,i) = dlmread(files{i},'\t',0,1);
end

plot(MZ,Ywings)

% Normalization

YwingsN = msnorm(MZ,Ywings,'MAX',1);

plot(MZ,Ywings)
%%

% Smoothing
YS = mssgolay(MZ,Ywings,'SPAN',35,'SHOWPLOT',3);
plot(MZ,YS)

%%
% Plot
sample = importdata('07-AK-12D-TX-WG1.dpt');
sample2 = importdata('08-AK-12D-TX-WG1.dpt');
sample3 = importdata('09-AK-12D-TX-WG1.dpt');
MZ = sample(:,1);
Y = sample(:,2);
Y2 = sample2(:,2);
Y3 = sample3(:,2);

plot(MZ,Y)
hold on
plot(MZ,Y2)
plot(MZ,Y3)
set(gca, 'XDir','reverse')
title('Mid infrared Spectra of An. gambiae (kisumu) wings 12 days old')
xlabel('Wavenumbers (cm -1)') 
ylabel('Absorbance')

hold off

%%

plot(MZ, Ywings)
set(gca, 'XDir','reverse')
title('Mid infrared Spectra of An. kisumu wings 12 days old')
xlabel('Wavenumbers (cm -1)') 
ylabel('Absorbance')


sample = importdata('06-AK-12D-AB3.dpt'); 
MZ = sample(:,1); %create wavenumbers variable
Y = sample(:,2);

plot(MZ,Y)

%%

YwingsN = msnorm(MZ,Ywings,'MAX',1);

[n,m] = size(Ywings)

Ymean = mean(YwingsN,2);

Yzero = YwingsN - Ymean;

plot(MZ, Yzero)
set(gca, 'XDir','reverse')
%%

for i=1:n
    for j=1:m
        a(i)= mean(Y(i,:));
        R(i,j)= Y(i,j) - a(i);      
    end
end

%%
% import data
sample = importdata('04-AK-12D-WG1.dpt'); 
MZ = sample(:,1); %create wavenumbers variable
z = size(MZ,1);

dinfo = dir ('*12D-LG*.dpt'); %read files in current directory with .dpt extension
files = {dinfo.name}; %create a cell array with the names of the files in the directory
a = length(files); %number of files to use in the for loop
Y12D = zeros(z, a); %preallocation of Y

for i = 1:a %loop extract every second column of each file and append into Y variable
    Y12D(:,i) = dlmread(files{i},'\t',0,1);
end

dinfo = dir ('*1D-LG*.dpt'); %read files in current directory with .dpt extension
files = {dinfo.name}; %create a cell array with the names of the files in the directory
a = length(files); %number of files to use in the for loop
Y1D = zeros(z, a); %preallocation of Y

for i = 1:a %loop extract every second column of each file and append into Y variable
    Y1D(:,i) = dlmread(files{i},'\t',0,1);
end


Y1mean = mean(Y1D,2);
Y12mean = mean(Y12D,2);

Ymean = [Y1mean,Y12mean];

YW = [MZ,Ymean]
Yw2 = YW.';

YmeanN = msnorm(MZ,Ymean,'MAX',1);
h = plot(MZ,YmeanN,'LineWidth',2)
set(h, {'color'}, {[1 0 0]; [0 0.45 0.74]});
set(gca, 'XDir','reverse')
legend('1 day old','12 days old')

%%

plot(MZ,Y1mean,'r','LineWidth',2)
hold on
plot(MZ,Y12mean,'Color',[0 0.45 0.74],'LineWidth',2)
set(gca, 'XDir','reverse')
legend('1 day old','12 days old')
ylabel('Absorbance')
xlabel('Wavenumbers')
%%
Yout = msbackadj(MZ, Y12D,'WindowSize',50)

%%
a = files(2)

