clear all
close all
clc

dat=load('binaryalphadigs.mat');
tailleImage=size(dat.dat{1,1});
data=lire_alpha_digit( 'AB12ZX', dat.dat,dat.classlabels);
taille_out=5000;
nbIter=1000;
learningRate=0.1;
batchSize=100;
nbImages=20;
nbIterGibbs=3000;
[RBM] = init_RBM(size(data,2), taille_out);
[ RBM,err ] = trainRBM(RBM,data,nbIter,learningRate, batchSize);
[ v ] = generer_image_RBM( RBM,nbIterGibbs,nbImages,tailleImage);
