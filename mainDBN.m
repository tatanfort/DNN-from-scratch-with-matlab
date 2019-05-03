clear all
close all
clc

dat=load('binaryalphadigs.mat');
tailleImage=size(dat.dat{1,1});
data=lire_alpha_digit( 'CD56879SZ', dat.dat,dat.classlabels);
%taille_out=5000;
nbIter=1000;
learningRate=0.1;
batchSize=100;
nbImages=50;
nbIterGibbs=3000;
tailleReseau=[320,500,500,500,500,500,500,9];
[ DBN ] = init_DBN( tailleReseau);
[ DBN] = train_DBN( DBN, nbIter, learningRate, batchSize,data);
[ image ] = generer_image_DBN( DBN,nbIterGibbs,nbImages,tailleImage,tailleReseau);
