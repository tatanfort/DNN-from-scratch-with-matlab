function [ DBN ] = train_DBN( DBN, nbIter, learningRate, batchSize,data)

for i=1:(length(DBN.RBM)-1)
    DBN.RBM{i}=trainRBM(DBN.RBM{i},data,nbIter,learningRate, batchSize);
    data=entree_sortie_RBM(data,DBN.RBM{i});
end
    
end

