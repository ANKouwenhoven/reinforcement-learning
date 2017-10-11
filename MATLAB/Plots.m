clc; clear;
load('Data4_CriterionActions.mat');
load('Data4_CriterionTrials.mat');

figure;
averageToy = mean(Data4_ToyMaze(1:20,:),2);
plot(1:20,averageToy);
title('Performance average of 10 runs in Toy Maze');
ylabel('Actions per trial');
xlabel('Trial number');

figure;
averageEasy = mean(Data4_EasyMaze(1:2,:),2);
plot(1:2,averageEasy);
title('Performance average of 10 runs in Easy Maze');
ylabel('Actions per trial');
xlabel('Trial number');

figure;
averageEasy = mean(Data4b_EasyMaze(1:20,:),2);
plot(1:20,averageEasy);
title('Performance average of 10 runs in Easy Maze');
ylabel('Actions per trial');
xlabel('Trial number');

%%

load('Data6_toy.mat');
load('Data6_easy.mat');

figure;
averageToy = mean(Data6_toy(:,:),2);
plot(1:50,averageToy);
title('Performance average of 10 runs in Toy Maze with Q-learning');
ylabel('Actions per trial');
xlabel('Trial number');

figure;
averageEasy = mean(Data6_easy(:,:),2);
plot(1:100,averageEasy);
title('Performance average of 10 runs in Easy Maze with Q-learning');
ylabel('Actions per trial');
xlabel('Trial number');

%%
load('DataE_easy.mat');

trials = 100;
runs = 10;

DataE00_easy = zeros(trials,runs);
DataE02_easy = zeros(trials,runs);
DataE04_easy = zeros(trials,runs);
DataE06_easy = zeros(trials,runs);
DataE08_easy = zeros(trials,runs);
DataE10_easy = zeros(trials,runs);


for i = 1:runs
    DataE00_easy(:,i) = DataEEasy((i-1)*trials+1 : i*trials, 1);
    DataE02_easy(:,i) = DataEEasy((i-1)*trials+1 : i*trials, 2);
    DataE04_easy(:,i) = DataEEasy((i-1)*trials+1 : i*trials, 3);
    DataE06_easy(:,i) = DataEEasy((i-1)*trials+1 : i*trials, 4);
    DataE08_easy(:,i) = DataEEasy((i-1)*trials+1 : i*trials, 5);
    DataE10_easy(:,i) = DataEEasy((i-1)*trials+1 : i*trials, 6);
end

figure;
hold on;
averageE00 = mean(DataE00_easy(:,:),2);
averageE02 = mean(DataE02_easy(:,:),2);
averageE04 = mean(DataE04_easy(:,:),2);
averageE06 = mean(DataE06_easy(:,:),2);
averageE08 = mean(DataE08_easy(:,:),2);
averageE10 = mean(DataE10_easy(:,:),2);

plot(1:trials,averageE00);
plot(1:trials,averageE02,'--');
plot(1:trials,averageE04,':');
plot(1:trials,averageE06,'-.');
plot(1:trials,averageE08);
plot(1:trials,averageE10,'--');
legend('0.0','0.2','0.4','0.6','0.8','1.0');

title('Performance average of 10 runs with different epsilons (Easy Maze)');
ylabel('Actions per trial');
xlabel('Trial number');

%%
load('DataE_toy.mat');

trials = 50;
runs = 10;

DataE00_toy = zeros(trials,runs);
DataE02_toy = zeros(trials,runs);
DataE04_toy = zeros(trials,runs);
DataE06_toy = zeros(trials,runs);
DataE08_toy = zeros(trials,runs);
DataE10_toy = zeros(trials,runs);


for i = 1:runs
    DataE00_toy(:,i) = DataEtoy((i-1)*trials+1 : i*trials, 1);
    DataE02_toy(:,i) = DataEtoy((i-1)*trials+1 : i*trials, 2);
    DataE04_toy(:,i) = DataEtoy((i-1)*trials+1 : i*trials, 3);
    DataE06_toy(:,i) = DataEtoy((i-1)*trials+1 : i*trials, 4);
    DataE08_toy(:,i) = DataEtoy((i-1)*trials+1 : i*trials, 5);
    DataE10_toy(:,i) = DataEtoy((i-1)*trials+1 : i*trials, 6);
end

figure;
hold on;
averageE00 = mean(DataE00_toy(:,:),2);
averageE02 = mean(DataE02_toy(:,:),2);
averageE04 = mean(DataE04_toy(:,:),2);
averageE06 = mean(DataE06_toy(:,:),2);
averageE08 = mean(DataE08_toy(:,:),2);
averageE10 = mean(DataE10_toy(:,:),2);

plot(1:trials,averageE00);
plot(1:trials,averageE02,'--');
plot(1:trials,averageE04,':');
plot(1:trials,averageE06,'-.');
plot(1:trials,averageE08);
plot(1:trials,averageE10,'--');
legend('0.0','0.2','0.4','0.6','0.8','1.0');

title('Performance average of 10 runs with different epsilons (Toy Maze)');
ylabel('Actions per trial');
xlabel('Trial number');

%%
% Alpha 0.1
load('DataAlpha.mat')

trials = 100;
runs = 10;

DataE00_easy = zeros(trials,runs);
DataE02_easy = zeros(trials,runs);
DataE04_easy = zeros(trials,runs);
DataE06_easy = zeros(trials,runs);
DataE08_easy = zeros(trials,runs);

for i = 1:runs
    DataE00_easy(:,i) = DataAlpha01((i-1)*trials+1 : i*trials, 1);
    DataE02_easy(:,i) = DataAlpha01((i-1)*trials+1 : i*trials, 2);
    DataE04_easy(:,i) = DataAlpha01((i-1)*trials+1 : i*trials, 3);
    DataE06_easy(:,i) = DataAlpha01((i-1)*trials+1 : i*trials, 4);
    DataE08_easy(:,i) = DataAlpha01((i-1)*trials+1 : i*trials, 5);
end

figure;
hold on;
averageE00 = mean(DataE00_easy(:,:),2);
averageE02 = mean(DataE02_easy(:,:),2);
averageE04 = mean(DataE04_easy(:,:),2);
averageE06 = mean(DataE06_easy(:,:),2);
averageE08 = mean(DataE08_easy(:,:),2);

plot(1:trials,averageE00);
plot(1:trials,averageE02,'--');
plot(1:trials,averageE04,':');
plot(1:trials,averageE06,'-.');
plot(1:trials,averageE08);
legend('0.0','0.2','0.4','0.6','0.8');

title('Performance average of 10 runs with different epsilons and alpha = 0.1 (Easy Maze)');
ylabel('Actions per trial');
xlabel('Trial number');

%%
% Alpha 0.3
load('DataAlpha.mat')

trials = 100;
runs = 10;

DataE00_easy = zeros(trials,runs);
DataE02_easy = zeros(trials,runs);
DataE04_easy = zeros(trials,runs);
DataE06_easy = zeros(trials,runs);
DataE08_easy = zeros(trials,runs);

for i = 1:runs
    DataE00_easy(:,i) = DataAlpha03((i-1)*trials+1 : i*trials, 1);
    DataE02_easy(:,i) = DataAlpha03((i-1)*trials+1 : i*trials, 2);
    DataE04_easy(:,i) = DataAlpha03((i-1)*trials+1 : i*trials, 3);
    DataE06_easy(:,i) = DataAlpha03((i-1)*trials+1 : i*trials, 4);
    DataE08_easy(:,i) = DataAlpha03((i-1)*trials+1 : i*trials, 5);
end

figure;
hold on;
averageE00 = mean(DataE00_easy(:,:),2);
averageE02 = mean(DataE02_easy(:,:),2);
averageE04 = mean(DataE04_easy(:,:),2);
averageE06 = mean(DataE06_easy(:,:),2);
averageE08 = mean(DataE08_easy(:,:),2);

plot(1:trials,averageE00);
plot(1:trials,averageE02,'--');
plot(1:trials,averageE04,':');
plot(1:trials,averageE06,'-.');
plot(1:trials,averageE08);
legend('0.0','0.2','0.4','0.6','0.8');

title('Performance average of 10 runs with different epsilons and alpha = 0.3 (Easy Maze)');
ylabel('Actions per trial');
xlabel('Trial number');

%%
% Alpha 0.5
load('DataAlpha.mat')


trials = 100;
runs = 10;

DataE00_easy = zeros(trials,runs);
DataE02_easy = zeros(trials,runs);
DataE04_easy = zeros(trials,runs);
DataE06_easy = zeros(trials,runs);
DataE08_easy = zeros(trials,runs);

for i = 1:runs
    DataE00_easy(:,i) = DataAlpha05((i-1)*trials+1 : i*trials, 1);
    DataE02_easy(:,i) = DataAlpha05((i-1)*trials+1 : i*trials, 2);
    DataE04_easy(:,i) = DataAlpha05((i-1)*trials+1 : i*trials, 3);
    DataE06_easy(:,i) = DataAlpha05((i-1)*trials+1 : i*trials, 4);
    DataE08_easy(:,i) = DataAlpha05((i-1)*trials+1 : i*trials, 5);
end

figure;
hold on;
averageE00 = mean(DataE00_easy(:,:),2);
averageE02 = mean(DataE02_easy(:,:),2);
averageE04 = mean(DataE04_easy(:,:),2);
averageE06 = mean(DataE06_easy(:,:),2);
averageE08 = mean(DataE08_easy(:,:),2);

plot(1:trials,averageE00);
plot(1:trials,averageE02,'--');
plot(1:trials,averageE04,':');
plot(1:trials,averageE06,'-.');
plot(1:trials,averageE08);
legend('0.0','0.2','0.4','0.6','0.8');

title('Performance average of 10 runs with different epsilons and alpha = 0.5 (Easy Maze)');
ylabel('Actions per trial');
xlabel('Trial number');

%%
% Alpha 0.7
load('DataAlpha.mat')

trials = 100;
runs = 10;

DataE00_easy = zeros(trials,runs);
DataE02_easy = zeros(trials,runs);
DataE04_easy = zeros(trials,runs);
DataE06_easy = zeros(trials,runs);
DataE08_easy = zeros(trials,runs);

for i = 1:runs
    DataE00_easy(:,i) = DataAlpha07((i-1)*trials+1 : i*trials, 1);
    DataE02_easy(:,i) = DataAlpha07((i-1)*trials+1 : i*trials, 2);
    DataE04_easy(:,i) = DataAlpha07((i-1)*trials+1 : i*trials, 3);
    DataE06_easy(:,i) = DataAlpha07((i-1)*trials+1 : i*trials, 4);
    DataE08_easy(:,i) = DataAlpha07((i-1)*trials+1 : i*trials, 5);
end

figure;
hold on;
averageE00 = mean(DataE00_easy(:,:),2);
averageE02 = mean(DataE02_easy(:,:),2);
averageE04 = mean(DataE04_easy(:,:),2);
averageE06 = mean(DataE06_easy(:,:),2);
averageE08 = mean(DataE08_easy(:,:),2);

plot(1:trials,averageE00);
plot(1:trials,averageE02,'--');
plot(1:trials,averageE04,':');
plot(1:trials,averageE06,'-.');
plot(1:trials,averageE08);
legend('0.0','0.2','0.4','0.6','0.8');

title('Performance average of 10 runs with different epsilons and alpha = 0.7 (Easy Maze)');
ylabel('Actions per trial');
xlabel('Trial number');

%%
% Alpha 1.0
load('DataAlpha.mat')

trials = 100;
runs = 10;

DataE00_easy = zeros(trials,runs);
DataE02_easy = zeros(trials,runs);
DataE04_easy = zeros(trials,runs);
DataE06_easy = zeros(trials,runs);
DataE08_easy = zeros(trials,runs);

for i = 1:runs
    DataE00_easy(:,i) = DataAlpha10((i-1)*trials+1 : i*trials, 1);
    DataE02_easy(:,i) = DataAlpha10((i-1)*trials+1 : i*trials, 2);
    DataE04_easy(:,i) = DataAlpha10((i-1)*trials+1 : i*trials, 3);
    DataE06_easy(:,i) = DataAlpha10((i-1)*trials+1 : i*trials, 4);
    DataE08_easy(:,i) = DataAlpha10((i-1)*trials+1 : i*trials, 5);
end

figure;
hold on;
averageE00 = mean(DataE00_easy(:,:),2);
averageE02 = mean(DataE02_easy(:,:),2);
averageE04 = mean(DataE04_easy(:,:),2);
averageE06 = mean(DataE06_easy(:,:),2);
averageE08 = mean(DataE08_easy(:,:),2);

plot(1:trials,averageE00);
plot(1:trials,averageE02,'--');
plot(1:trials,averageE04,':');
plot(1:trials,averageE06,'-.');
plot(1:trials,averageE08);
legend('0.0','0.2','0.4','0.6','0.8');

title('Performance average of 10 runs with different epsilons and alpha = 1.0 (Easy Maze)');
ylabel('Actions per trial');
xlabel('Trial number');

%% 
% Epsilon 0.1
% Alpha 0.1 - 0.9

load('DataE01AA.mat');

trials = 100;
runs = 10;

DataA01_easy = zeros(trials,runs);
DataA03_easy = zeros(trials,runs);
DataA05_easy = zeros(trials,runs);
DataA07_easy = zeros(trials,runs);
DataA09_easy = zeros(trials,runs);

for i = 1:runs
    DataA01_easy(:,i) = DataE01AA((i-1)*trials+1 : i*trials, 1);
    DataA03_easy(:,i) = DataE01AA((i-1)*trials+1 : i*trials, 2);
    DataA05_easy(:,i) = DataE01AA((i-1)*trials+1 : i*trials, 3);
    DataA07_easy(:,i) = DataE01AA((i-1)*trials+1 : i*trials, 4);
    DataA09_easy(:,i) = DataE01AA((i-1)*trials+1 : i*trials, 5);
end

figure;
hold on;
averageA01 = mean(DataA01_easy(:,:),2);
averageA03 = mean(DataA03_easy(:,:),2);
averageA05 = mean(DataA05_easy(:,:),2);
averageA07 = mean(DataA07_easy(:,:),2);
averageA09 = mean(DataA09_easy(:,:),2);

plot(1:trials,averageA01);
plot(1:trials,averageA03,'--');
plot(1:trials,averageA05,':');
plot(1:trials,averageA07,'-.');
plot(1:trials,averageA09);
legend('0.1','0.3','0.5','0.7','0.9');

title('Performance average of 10 runs with different alphas and epsilon = 0.1 (Easy Maze)');
ylabel('Actions per trial');
xlabel('Trial number');