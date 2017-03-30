%%% A file to test out basic_elm on the GTZAN features extracted!

close all; clear all; clc

%%% Set the path
addpath('/media/coding_coffee/New Volume/Projects/extremeMachineLearning/elmLib/basic_elm')

%%% Loading the dataset
load /media/coding_coffee/'New Volume'/Projects/extremeMachineLearning/data/GTZAN/featuresOfGTZAN.mat

%%% Modify the dataset to match the requirements of the ELM function
Feats = [ones(size(Feats,1),1) Feats];
for i=1:9
	Feats(100*i+1:100*(i+1), 1) = i+1;
end
%%% Modify the dataset to delete NaN values
Feats = [Feats(:,1:6) Feats(:,8:size(Feats,2))];


%%% Segregating the dataset into training and testing data and saveing in cache
j=1;
for i=1:size(Feats,1)
	if mod(i,2)==1
		Feats_train(j,:) = Feats(i,:);
	else
		Feats_test (j,:) = Feats(i,:);
		j=j+1;
	end
end
save Feats_train.data Feats_train
save Feats_test.data Feats_test

%%% Calling the function
elm('Feats_train.data', 'Feats_test.data', 1, 2000, 'sigmoid')

%%% Clearing cache
delete Feats_train.data
delete Feats_test.data