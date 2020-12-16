clc; clear; close all; 

%%
%%This section was run to visually inspect the dataset.
%%It plots the total force against the time points from 6 to 12 seconds.

datac=load ('GaCo01_01.txt');  %loads data from the selected file into datac variable (Controls)
timec=datac(1:1184,1);%selects data from the 1st column (time) and saves it to timec variable
forcecl=datac(1:1184,18); %selects data from the 18th column(total force on left foot) and saves it to forcecl variable
forcecr=datac(1:1184,19); %data from the 19th column (total force on right foot) and saves it to forcecr variable

datap=load('GaPt06_01.txt'); %loads data from the selected file into datap variable (Parkinsonâ€™s)
timep=datap(1:1184,1); %selects data from the 1st column (time) and saves it to timep variable
forcepl=datap(1:1184,18); %selects data from the 18th column and saves it to forcecl variable
forcepr=datap(1:1184,19); %data from the 19th column and saves it to forcepr variable

figure(1)  %defines the following as figure 1
subplot(211) %creates a 1x2 subplot and indexes position 1
plot(timec,forcecl) %plots forcecl vs. timec in first spot of subplot
xlabel('Time(s)'); %labeling axes and title for this line and next 2
ylabel('Total Vertical Ground Force (N)');
title ('Total Force on Left Foot of Control');
subplot(212) %indexes position 2 of subplot 
plot(timep,forcepl) %plots forcepl vs. timep in second spot of subplot
xlabel('Time(s)'); %labeling axes and title for this line and next 2
ylabel('Total Vertical Ground Force (N)');
title ('Total Force on Left Foot of Parkinson"s');

figure(2) %defines the following as figure 2
subplot(211) %creates a 1x2 subplot and indexes position 1
plot(timec,forcecr) %plots forcecr vs. timec in first spot of subplot
xlabel('Time(s)'); %labeling axes and title for this line and next 2
ylabel('Total Vertical Ground Force (N)');
title ('Total Force on Right Foot of Control');
subplot(212) %indexes position 2 of subplot 
plot(timep,forcepr) %plots forcepr vs. timep in second spot of subplot
xlabel('Time(s)'); %labeling axes and title for this line and next 2
ylabel('Total Vertical Ground Force (N)');
title ('Total Force on Right Foot of Parkinson"s') ;
%%

%This section creates a Fourier Transform of the data and generates plots for a 
%visual representation. Putting the data into the frequency domain allowed for better 
%inspection of differences between the Control and Parkinsonâ€™s groups. 
%This section was also done before our working code as a way for us to better visualize the data. 

fs=100; %defines sampling frequency (fs) as 100, which we got from the data set
N1=length(forcecl); %puts the length of forcecl into a variable N1 
f1=(0:N1-1)/N1*fs;%defines f1 as function of N1 and fs
fforcecl=abs(fft(forcecl)); %sets variable fforcecl equal to the absolute value of FT of forcecl

N2=length(forcepl); %sets N2 equal to length of forcepl
f2=(0:N2-1)/N2*fs; %defines f2 as function of N2 and fs
fforcepl=abs(fft(forcepl)); %sets variable fforcepl equal to the absolute value of FT of forcepl


N3=length(forcecr); %puts the length of forcecr into a variable N3 
N4=length(forcepr); %puts the length of forcepr into a variable N4
f3=(0:N3-1)/N3*fs; %defines f3 as function of N3 and fs
f4=(0:N4-1)/N4*fs; %defines f4 as function of N4 and fs
fforcecr=abs(fft(forcecr)); %sets variable fforcecr equal to the absolute value of FT of forcecr
fforcepr=abs(fft(forcepr)); %sets variable fforcepr equal to the absolute value of FT of forcepr


figure(3) %new figure made to plot FT value of forces for both the Parkinsonâ€™s and Controls on left foot
subplot(211) %creates a 1x2 subplot and indexes position 1
plot(f1,fforcecl) %plots fforcecr vs. f3 in first spot of subplot
xlabel('Frequency(Hz)'); %labeling axes and title for this line and next 2
ylabel('Amplitude');
title ('Fourier Tansform of Total Force on Left Foot of Control');
subplot(212) %indexes position 2 of subplot 
plot(f2, fforcepl) %plots fforcepl vs. f2  in second spot of subplot 
xlabel('Frequency(Hz)'); %labeling axes and title for this line and next 2
ylabel('Amplitude');
title ('Fourier Tansform of Total Force on Left Foot of Parkinson"s');

figure(4) % new figure made to plot FT values of forces for both Parkinsonâ€™s and Controls on right foot
subplot(211) %creates a 1x2 subplot and indexes position 1
plot(f3,fforcecr) %plots fforcecr vs. f3 in first spot of subplot
xlabel('Frequency(Hz)');
ylabel('Amplitude');
title ('Fourier Tansform of Total Force on Right Foot of Control');
subplot(212) %indexes position 2 of subplot 
plot(f4, fforcepr) %plots fforcepr vs. f4 in second spot of subplot
xlabel('Frequency(Hz)');
ylabel('Amplitude');
title ('Fourier Tansform of Total Force on Right Foot of Parkinson"s');

%%
%%This section consolidates all files from both the Control and Parkinsonâ€™s 
%files generated earlier into a single file called all_data, which can then 
%be used in Matlabâ€™s Classification Learner App to train and test our data with machine learning. 


all_data1 = []; %initializing empty matrix 
%Generates a dataset thats empty where weâ€™ll put the information in to use the classification learner application in MATLAB
files1 = dir('Control/*.txt'); %directs control data into a new vector files1
len1 = length(files1); %gets length of files1 vector
for k = 1:len1 %this loop runs through all the files in the control folder
    data1 = importdata(files1(k).name); %opening file in order to extract data 
    data1 = data1(602:1202,[1,end-1,end]); %extracting info regarding time point and total force on left and right foot
    temp1 = k*ones(length(data1),1); %numbering the patient at each time point 
    predict1=zeros(601,1); %labeling each patient at each time point as 0 for control
    data1 = [temp1 data1 predict1]; %organizing all extracted info into one matrix 
    all_data1 = [all_data1 ; data1]; %inserting info in empty matrix
end

all_data2 = []; %generates empty data set for Parkinsonâ€™s data
files2 = dir('Parkinsons/*.txt'); %directs Parkinsonâ€™s data into a new vector files2
len2 = length(files2); %gets length of files2 vector
for k = 1:len2 %this loop runs through all the files in the Parkinsons folder
    data2 = importdata(files2(k).name); %opening file in order to extract data
    data2 = data2(602:1202,[1,end-1,end]); %extracting info regarding time point and total force on left and right foot
    temp2 = k*ones(length(data2),1); %numbering the patient at each time point 
    predict2=ones(601,1); %labeling each patient at each time point as 1 for Parkinsons
    data2 = [temp2 data2 predict2]; %organizing all extracted info into one matrix
    all_data2 = [all_data2 ; data2]; %inserting info in empty matrix
end
all_data = [all_data1 ; all_data2]; %concatenates the two data files into one singular data file to be used in Classification Learner 
save('alldata.mat', 'all_data') %saves the new singular data file

% This for loop consolidates all the files for the testing folder 
% this .mat file will be used to run through training model

all_test = []; %generates empty data set for testing data
file = dir('Testing/*.txt'); %directs testing data into a new vector files2
len = length(file); %gets length of files2 vector
for k = 1:len %this loop runs through all the files in the testing folder
    data = importdata(files2(k).name); %opening file in order to extract data
    data = data(602:1202,[1,end-1,end]); %extracting info regarding time point and total force on left and right foot
    temp = k*ones(length(data),1); %numbering the patient at each time point
    data = [temp2 data]; %organizing all extracted info into one matrix
    all_test = [all_test ; data]; %inserting info in empty matrix
end
save('alldata.mat', 'all_test') %saves the new testing data file



%%
%This section creates the Confusion chart.
%The data is separated into either positive(1â€™s) or negatives(0â€™s)
% This is then compared to the actual files and the comparison is put into the confusion chart

load('modelscode.mat', 'trainedModelfgsvmcode') % loads the training model created by the matlab classifier tool 
load('alltest.mat') % loads all the testing data 

pred = trainedModelfgsvmcode.predictFcn(all_test); %function to create actual labels by running testing data
%through the training model

%this section finds out whether each patient is control or parkinsons since the labels were for 
%each time point. This sections labels each patient as control or Parkinsons
num_patients = length(pred)/601; % finding number of patients, 601 is number of time points
pred_final = zeros(1,num_patients); %creating vector with zeros that is the same length as 
%number of patients that needed to be labeled 
for i = 1:num_patients %runs through number of patients 
    patient_avg = mean(pred((601*(i-1))+1:(601*i))); %finding the mean of the labled time points
    if patient_avg < 0.5  %if mean is less than .5 it is labeled as control patient 
        patient_avg = 0;
    else
        patient_avg = 1; %if mean is greater than .5 labeled as Parkinsons patient
    end
    pred_final(i) = patient_avg; %inserting value of control, 0, or parkinsons, 1, into predicted
    %labels matrix
end

%creating matrix of actual labels 
% Positive/False Data vectors (ones = positive, zeros = negative)
a = ones(1,13);
b = zeros(1,4);
c = ones(1,32);
d = zeros(1,4);
e = ones(1,8);
f = zeros(1,7);

actual_labels = [a b c d e f];

true_actual_idx = actual_labels==1;

%This finds the length of the true situations

actual_pos = length(actual_labels(true_actual_idx));
actual_neg = length(actual_labels(~true_actual_idx));
N=actual_pos+actual_neg;

%This section evaluated which data was labeled as a true positive, true negative, false positive, and false negative

tp = sum(actual_labels(true_actual_idx)==pred_final(true_actual_idx));
tn = sum(actual_labels(~true_actual_idx)==pred_final(~true_actual_idx));
fp = actual_neg - tn;
fn = actual_pos - tp;

%The following will calculate classification metrics
%accuracy, sensitivity, specificity, precision, recall, etc.

tp_rate=tp/actual_pos;
tn_rate=tn/actual_neg;

accuracy = (tp+tn)/N;
sensitivity = tp_rate;
specificity = tn_rate;
precision = tp/(tp+fp);
recall = sensitivity;

figure(5)
confusionchart(actual_labels, pred_final); %this creates the final confusion matrix



