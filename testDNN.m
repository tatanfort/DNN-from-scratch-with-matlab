clear all
close all
clc

[ TrainImages, TrainLabels, TestImages, TestLabels ] = mnistread( );
subsample=500;
TrainImages=TrainImages(1:subsample,:);
TrainLabels=TrainLabels(1:subsample,:);
nbIter=1000;
learningRate=0.1;
batchSize=100;
%nbImages=50;
nbIterGibbs=3000;
nbhidmax=6;
nbneuron=100;
nbneuronmax=3000;
nbhid=2;
pas=500;
for i=1:nbhidmax
  tailleReseau= ones(1,i+2);
  tailleReseau=tailleReseau*nbneuron;
  tailleReseau(1)=size(TrainImages,2);
  tailleReseau(end)=10;
  [ DBN ] = init_DBN( tailleReseau);
  [DBN, rmse1] = retropropagation(DBN, TrainImages, TrainLabels, nbIter,learningRate,batchSize);
  [error_rate_train1,error_rate_test1]=evaMNIST(DBN,TrainImages,TrainLabels,TestImages,TestLabels);
  [ DBN ] = init_DBN( tailleReseau);
  [ DBN] = train_DBN( DBN, nbIter, learningRate, batchSize,TrainImages);
  [DBN, rmse2] = retropropagation(DBN, TrainImages, TrainLabels, nbIter,learningRate,batchSize);
  [error_rate_train2,error_rate_test2]=evaMNIST(DBN,TrainImages,TrainLabels,TestImages,TestLabels);
  vec_error_rate_test1(i)= error_rate_test1;
  vec_error_rate_test2(i)= error_rate_test2;
  end
figure(1)
col=hsv(2);
plot(vec_error_rate_test1,'color',col(1,:))
hold on
plot(vec_error_rate_test2,'color',col(2,:))
xlabel('nombres de couches')
ylabel('erreur sur les données test')
title('evolution de erreur de test en fonction du nombres de couches. nbneuron=100')
legend('retro','unsup+retro')
print('a')
for i=1:pas:nbneuronmax
  tailleReseau=ones(1,nbhid+2)*i;
  tailleReseau(1)=size(TrainImages,2);
  tailleReseau(end)=10;
  [ DBN ] = init_DBN( tailleReseau);
  [DBN, rmse1] = retropropagation(DBN, TrainImages, TrainLabels, nbIter,learningRate,batchSize);
  [error_rate_train1,error_rate_test1]=evaMNIST(DBN,TrainImages,TrainLabels,TestImages,TestLabels);
  [ DBN ] = init_DBN( tailleReseau);
  [ DBN] = train_DBN( DBN, nbIter, learningRate, batchSize,TrainImages);
  [DBN, rmse2] = retropropagation(DBN, TrainImages, TrainLabels, nbIter,learningRate,batchSize);
  [error_rate_train2,error_rate_test2]=evaMNIST(DBN,TrainImages,TrainLabels,TestImages,TestLabels);
  vec_error_rate_test1(i+pas(i-1))= error_rate_test1;
  vec_error_rate_test2(i+pas(i-1))= error_rate_test2;
  end
figure(2)
col=hsv(2);
plot(vec_error_rate_test1,'color',col(1,:))
hold on
plot(vec_error_rate_test2,'color',col(2,:))
xlabel('nombres de neurones')
ylabel('erreur sur les données test')
title('evolution de erreur de test en fonction du nombres de neurones. nbhid=2')
legend('retro','unsup+retro')
