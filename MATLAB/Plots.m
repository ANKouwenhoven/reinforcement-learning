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