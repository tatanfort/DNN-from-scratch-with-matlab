function [ out ] = entree_sortie_RBM(data,RBM )

out=1./(1+exp(-(repmat(RBM.b,size(data,1),1)+data*RBM.w)));

end

