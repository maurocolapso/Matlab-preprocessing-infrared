function [Y MZ] = importIRfiles(mozziename)
%This function import .dpt files from a folder. 
%This function returns a martix Y with a numebr of columns the same as
%files in the folder
%You need to specify the part of the mosquito and the age you are looking
%for: 
% ex: *1D-HE*.dpt

dinfo = dir (mozziename); %read files in current directory with what the user specify
files = {dinfo.name}; %create a cell array with the names of the files in the directory
firstfile = files(1:1); % extract the first filename
firstchar = char(firstfile);% converted to character
sample = importdata(firstchar); % imported
MZ = sample(:,1); %create wavenumbers variable
z = size(MZ,1);
a = length(files); %number of files to use in the for loop and number of files imported
Y = zeros(z, a); %preallocation of Y

for i = 1:a %loop extract every second column of each file and append into Y variable
    Y(:,i) = dlmread(files{i},'\t',0,1);
end


