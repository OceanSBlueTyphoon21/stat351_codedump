%{
Student: Anthony Bruno
STAT 351 - Homework #4

Description: ...
%}

clear
clc

%N = 1000000; % the number of values for each Xi (i = 1,2,3)
N = 50;
n = 20; % the number of trials for each Xi
p = 0.5; % the binomial probability of a success per trial
X1 = random('bino', n, p, [N,1]);
%{
the code line above generates an array of 1000000 of values called "X1".
the code generates a random xi from a binomial distribution with 20 trials
and a success probability of 0.5. xi represents the number of successes
from a 20-trial binomial (p=0.5) distribution. The same thing is done for
X2 and X3
%}
X2 = random('bino', n, p, [N,1]);
X3 = random('bino', n, p, [N,1]);

Y = min(X1,min(X2,X3)); % produces vector Y = [yi] = [min(x1_i, x2_i, x3_i)]

% create a histogram of the Discrete Random Variable (RV) Y.
bins = max(Y)-min(Y)+1; % bins for Y histogram
histogram(Y, bins, 'normalization', 'probability'); 
% Y is a discrete RV, so we can use 'probability' parameter to normalize

% Find the mean and standard Deviation of Y
Y_mean = mean(Y);
Y_stddev = std(Y);

% printing the Y mean and Standard deviation to MATLAB console
fprintf('Y Mean: %f \n',Y_mean);
fprintf('Y Standard Deviation: %f \n',Y_stddev);

% estimate the probability P(Y<=10)
prob_c = (sum(Y<=10)/N); % estimates P(Y<=10)
fprintf('~P(Y<=10): %f \n', round(prob_c,3));

