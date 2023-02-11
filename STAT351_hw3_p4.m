%{
course: STAT 351
Anthony Bruno
Homework Assignment #3
Problem #4
%}

clear
clc

% a) Generate 2 random samples of 1000000 (N = 1000000)
N = 1000000;
X1 = rand([1,N]); % vector of length N with random values between 0 and 1
X2 = rand([1,N]);

% b) plotting a normalized histogram for both random samples. The number of bins will be 20.
% histogram properties: normalization - pdf (probability density function)
% https://www.mathworks.com/help/matlab/ref/matlab.graphics.chart.primitive.histogram-properties.html
bins = 20;

figure(1)
histogram(X1, bins, 'normalization', 'pdf');
title('Normalized probability Density Function, X1')
xlabel('Domain of sample values possible')
ylabel('probability')

figure(2)
histogram(X2, bins, 'normalization','pdf');
title('Normalized probability Density Function, X2')
xlabel('Domain of sample values possible')
ylabel('probability')

% c) Add X1 and X2 to produce Y = X1 + X2, produce a histogram of Y
Y = X1 + X2;

% ---------- Y = X1+X2 Histogram -----------
figure(3)
histogram(Y, bins, 'normalization', 'pdf');
title('Probability Density of Y = X1+X2')
xlabel('Domain of summed sample values')
ylabel('probability')

% d) create another uniform distribution (X3) and plot a histogram of W = X1+X2+X3. 
X3 = rand([1,N]);
W  = X1+X2+X3;

% ---------- W = X1+X2+X3 Histogram -----------
figure(4)
histogram(W, bins, 'normalization', 'pdf')
title('Probability of Density of W = X1+X2+X3')
xlabel('Domain of summed sample values')
ylabel('Probability')

%{
Response to part e:
Both sequence sum histograms (Y and W) have a 'bell' shaped distribution.
As we go from Y to W, I notice that the median value has shifted downward
in the Probability Density. The X-axis range has increased but the shape of
W is "Thinner" around the median value, meaning the probability densities
are more compressed around the median value from Y to W.
%}

