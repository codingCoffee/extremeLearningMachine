%%% Used to call the ComputeMIRAudioFeatures funcion in order to extract features
%%% from the GTZAN dataset.

close all; clear all; clc

Feats = [];

musicGen = {'blues', 'classical', 'country', 'disco', 'hiphop', 'jazz', 'metal', 'pop', 'reggae', 'rock'};
count = 1;
tic
for gen=1:length(musicGen)
	for i=1:100
		if i<=10
			Feats(count, :) = ComputeMIRAudioFeatures(strcat(musicGen{gen},'/',musicGen{gen},'.0000',int2str(i-1),'.au'), 1);
		else
			Feats(count, :) = ComputeMIRAudioFeatures(strcat(musicGen{gen},'/',musicGen{gen},'.000' ,int2str(i-1),'.au'), 1);
		end
		count = count + 1;
		fprintf('\n %f percent done\n', count/10);
		fprintf('\n Time Elapsed: %f minutes\n', toc/60);
		fprintf('\n Estimated time remaining: %f minutes\n\n', ((100-count/10)*(toc/60)/(count/10)));
	end
end
save(strcat('featuresOfGTZAN','.mat'),'Feats');