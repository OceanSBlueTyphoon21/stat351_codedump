% Simple Linear Regression problem
clear
clc

% REMEMBER TO GENERATE THE SCATTER PLOT WITH LINEAR BASIC FIT

% Data from .csv file from problem 2
Distillation_process_data = readtable('distillationProcessData.xlsx');

hydrocarbon_levels = Distillation_process_data(:,2);
purity_production = Distillation_process_data(:,3);

% scatterplot creation
figure(1)
scatter(hydrocarbon_levels.Var2,purity_production.Var3)
title('Scatterplot')
xlabel('Hydrocarbon level (X %)')
ylabel('O2 Purity Production (Y %)')

% determine the correlation coefficient
R = corrcoef(hydrocarbon_levels.Var2,purity_production.Var3);
fprintf('Correlation between O2 Purity Production and Hydrocarbon Levels: %f \n',R(1,2))
fprintf('Correlation between Hydrocarbon Levels and O2 Purity Levels: %f \n',R(2,1))

% find the least square regression Line (y_hat = b_0 + b_1*x)
% predictor Variable: X = Hydrocarbon levels
% response Variable: Y = O2 Purity Production
model1 = fitlm(hydrocarbon_levels.Var2,purity_production.Var3);
disp(model1);
fprintf('\n');

% Use regression model to estimate Oxygen level purity for (x = 1%)
purity_estimate = 74.29 + 14.95*(1);
fprintf('(Regression Model) Hydrocarbon Level = 1 Percent, Estimated Oxygen Purity Production %f  \n',purity_estimate);
