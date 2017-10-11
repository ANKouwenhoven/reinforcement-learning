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