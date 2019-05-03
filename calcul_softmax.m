function proba = calcul_softmax(RBM, data_in)
aa=exp(data_in*RBM.w+repmat(RBM.b,size(data_in,1),1));
%bb=repmat(sum(exp(data_in*RBM.w+repmat(RBM.b,size(data_in,1),1))),size(aa,1),1);
bb=repmat(sum(aa,2),1,size(aa,2));
proba=aa./bb;
end