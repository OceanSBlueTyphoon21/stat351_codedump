%{
Student: Anthony Bruno
STAT 351 - Law of Large Numbers
Coin Tossing

NOTE: Use MATLAB's Run Section

Description: This MATLAB Script simulates tossing a fair coin.
Conceptually, the probability of observing Heads is 0.5 for a fair coin.
Assume 1 is heads and 0 is tails.
%}

clear
clc

n = 10; % total number of tosses of a fair coin
X = rand(1,n);  % Generate a matrix row of n values between 0 and 1
Y = X < 0.5; % Generate a matrix row of n 0's and and 1's so that we get a 1 if the element is <0.5 and 0 otherwise. Replacement of element

total_sum = sum(X); % sum all elements in X vector (Row matrix)
Relative_frequency  = total_sum/n; % relative frequency of observing heads (total) in n trials. ~average

% ---------------------------------------------------------------------------------------------------
%% This separates the two MATLAB scripts (USE Run Section to run a specific MATLAB code section)
%{
Student: Anthony Bruno
STAT 351 - Law of Large Numbers
Coin Tossing

Description: Again, this MATLAB code simulates a fair coin tossing but with
a varying number of toss. The relative frequency is then plotted against a
different number of trials.
%}

clear
clc

N = 1:5:2000; % varying the number of trial tosses by creating a sequence of n's of 1 to 2000 in increments of 5
% {1,6,11,16,21,31, ...}
I = length(N); % compute the length of vector N, this provides the number of relative frequency data points available for plotting.
% 1 relative frequency per n (n is in N)
relative_frequency_vector = zeros(1,I); %create a row matrix of zeros to save relative frequency values for each value of n in N.

% Loop through the vector of different n's (Vector N) and calculate the
% relative frequency for each n in N
% START loop
for i = 1:I
    X = rand(1,N(i)) < 0.5;
    relative_frequency_vector(i) = sum(X)/N(i);
end

% plotting ----------------
figure(1)
plot(N,relative_frequency_vector); % plot of relative_frequency vs. n trials
ylim([0,1]) % Set the probability (relative frequency) y-axis between 0 and 1.

% Create a horizontal line for expected probability of a coin toss for
% heads, which should be 0.5
hline = refline(0,0.5); % adding a reference line @ y-intercept = 0.5, with a slope of zero
% 0.5 horizontal line is the expected probability of getting heads for coin
% toss
hline.Color = 'green'; % Color of reference line
hline.LineWidth = 1.5;

% Plot Labels
xlabel('Number Trials (Experiemental, repeated times)')
ylabel('Relative Frequency (Probability) of observing heads')
title('Law of Large Numbers for Tosses of Fair Coin')
