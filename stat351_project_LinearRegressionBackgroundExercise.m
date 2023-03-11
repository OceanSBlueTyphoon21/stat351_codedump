% Linear Regression Project - Background Exercise
clear
clc

load fisheriris.mat % MATLAB formatted data set of Fisher's Iris dataset

sepal_length = meas(:,1);   % selects the sepal length column (column 1 of the meas data set)

sepal_length_mean = mean(sepal_length); % Arithmetic Average of sepal length
sepal_length_median = median(sepal_length_mean); % median is the 50th percentile
sepal_length_std = std(sepal_length);   % standard deviation of sepal length

% histograms of Sepal Length with bins = 5,10,20
figure(1)
histogram(sepal_length,5);  % histogram w/ bins=5
title('Sepal Length Histo, Bins = 5');
xlabel('Length');
ylabel('Counts');

figure(2)
histogram(sepal_length,10);  % histogram w/ bins=10
title('Sepal Length Histo, Bins = 10');
xlabel('Length');
ylabel('Counts');

figure(3)
histogram(sepal_length,20);  % histogram w/ bins=20
title('Sepal Length Histo, Bins = 20');
xlabel('Length');
ylabel('Counts');

% 5 number summary {min, Q1, median, Q3, max}
sepal_length_min = min(sepal_length); % min of sepal length
sepal_length_max = max(sepal_length); % max of sepal length

% Obtaining Q1 & Q3 
% 1) sort the data first
sorted_sepal_length = sort(sepal_length);
Q1 = median(sorted_sepal_length(find(sorted_sepal_length<median(sorted_sepal_length)))); % Q1 is the median of lower 1/2 of the sorted data set. 1st quartile
Q3 = median(sorted_sepal_length(find(sorted_sepal_length>median(sorted_sepal_length)))); % Q1 is the median of upper 1/2 of the sorted data set. 3rd quartile
IQR = Q3 - Q1; % Inner Quartile range between Q3 and Q1

% Box plot of 5 number summary
figure(4)
boxplot(sepal_length);

% Naming the data set columns
SepalL=meas(:,1);
SepalW=meas(:,2);
PetalL=meas(:,3);
PetalW=meas(:,4);

% The "Trend" between SepalL and SepalW
figure(5)
scatter(SepalL,SepalW)
title('SepalL vs SepalW');
xlabel('SepalL');
ylabel('SepalW');

% The "trend" between PetalL and PetalW
figure(6)
scatter(SepalL,PetalL)
title('SepalL vs PetalL');
xlabel('SepalL');
ylabel('PetalL');

% Fitting a line to SepalW vs. SepalL
% Predicter Variable = SepalW (X)
% Response Variable = SepalL (Y)
model_line1 = fitlm(SepalW, SepalL);

% Fitting a line to SepalW vs. SepalL
% Predicter Variable = SepalL (X)
% Response Variable = PetalL (Y)
model_line2 = fitlm(SepalL,PetalL);


