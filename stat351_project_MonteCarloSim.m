
clear
clc

% PART 1 Monte Carlo Simulation
% ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
% Random generate N values for each resistor in the circuit
N = 1000000;
% creates a N -length vector with random values generated from a Normal Distribution of ~normal(mu=20, sigma^2 = (2/3)^2)
R_1 = random('norm',20,2/3,[1,N]);
R_2 = random('norm',20,2/3,[1,N]);
R_3 = random('norm',20,2/3,[1,N]);

% creates a N -length vector with random values generated from a Normal Distribution of ~normal(mu=10, sigma^2 = (1/3)^2)
R_4 = random('norm',10,1/3,[1,N]);

% Finding the R_t knowing that R_1, R_2, and R_3 are in parallel and R_4 is
% in parallel with R_eq
A = (1./R_1) + (1./R_2) + (1./R_3); %A vector length N
R_eq = 1./A; % R_eq vector length N
R_t = R_eq + R_4; %R_t has length N

% mcs_part1.a ----------------------

% Histogram of R_eq
bins = 20;
figure(1)
histogram(R_eq,bins,'normalization','pdf');
title('Histogram of Equivalent Resistance (Req)');
xlabel('Equivalent Resistance (Req) ({\Omega})');
ylabel('Estimated PDF');

figure(2) %histogram of R_t
histogram(R_t,bins,'normalization','pdf');
title('Histogram of Total Resistance (Rt)');
xlabel('Total Resistance (Rt) ({\Omega})');
ylabel('Estimated PDF');

% mcs_part1.b is on written paper.

% mcs_part1.c -----------------------
%c.1 finding the mean of R_t
R_t_mean = mean(R_t);
fprintf('Total Resistance (R_t) mean: %f \n', R_t_mean);

%c.2 finding the standard deviation of R_t
R_t_std = std(R_t);
fprintf('Total Resistance Standard Deviation: %f \n', R_t_std);

%c.3 finding the minimum R_t that occurred in the simulation
R_t_min = min(R_t);
fprintf('Minimum Total Resistance (Simulated): %f \n',R_t_min);

% c.4 finding the maximum R_t that occurred in the simualtion
R_t_max = max(R_t);
fprintf('Maximum Total Resistance (Simulated): %f \n',R_t_max);

% c.5 Truncation
R_t_lowcutoff = round(prctile(R_t,0.5),2);
R_t_upcutoff = round(prctile(R_t,99.5),2);

% c.5 continued is on written paper
fprintf('Based on the simulation, 1 percent of the time the Total Resistance, R_t, is either above %g Ohms or is below %g Ohms \n',R_t_lowcutoff,R_t_upcutoff);
fprintf('\n');

% PART 2 Monte Carlo Simulation
% +++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++

% creates a N-length vector of random variable voltage. voltage_rv ~
% normal(mu = 18, sig^2 = 1)
voltage_rv = random('norm',18,1,[1,N]); 

% Current N-length vector, Ohm's law: V=IR
current_rv = voltage_rv./R_t;

% mcs_part2.a - Histogram of current vector
figure(3)
histogram(current_rv,bins,'Normalization','pdf');
title('Histogram of Current');
xlabel('Current (A)');
ylabel('Estimated pdf');

% mcs_part2.b - analytical computation of current on written page.

% mcs_part2.c
% c.1 - finding the mean of simulated current
current_mean = mean(current_rv);
fprintf('Simulated Current Mean: %f \n', current_mean);

% c.2 - finding the standard deviation of simulated current
current_std = std(current_rv);
fprintf('Simulated Current Standard Deviation: %f \n', current_std);

% c.3 - finding the minimum simulated current occurrence
current_min = min(current_rv);
fprintf('Minimum Simulated Current Occurrence: %f \n',current_min);

% c.4 - finding the maximum simulated current occurrence
current_max = max(current_rv);
fprintf('Maximum Simulated Current Occurrence: %f \n',current_max);

% c.5 - truncating the currentP_rv
current_lowcutoff = round(prctile(current_rv,0.5),2);
current_upcutoff = round(prctile(current_rv,99.5),2);

fprintf('Based on the simulation, 1 percent of the time the current, I, is either above %g Amperes or is below %g Amperes \n',current_lowcutoff,current_upcutoff);
fprintf('\n');

