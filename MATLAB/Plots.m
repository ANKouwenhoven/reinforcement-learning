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

load('DataE_toy.mat');

figure;
hold on;
averageE00 = mean(DataE00_toy(:,:),2);
averageE02 = mean(DataE02_toy(:,:),2);
averageE04 = mean(DataE04_toy(:,:),2);
averageE06 = mean(DataE06_toy(:,:),2);
averageE08 = mean(DataE08_toy(:,:),2);
averageE10 = mean(DataE10_toy(:,:),2);

plot(1:50,averageE00);
plot(1:50,averageE02,'--');
plot(1:50,averageE04,':');
plot(1:50,averageE06,'-.');
plot(1:50,averageE08);
plot(1:50,averageE10,'--');
legend('0.0','0.2','0.4','0.6','0.8','1.0');

title('Performance average of 10 runs with different epsilons');
ylabel('Actions per trial');
xlabel('Trial number');
