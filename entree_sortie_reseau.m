function [ sortie ] = entree_sortie_reseau( DBN, data_in )

for i=1:length(DBN.RBM)-1
    input_rbm=entree_sortie_RBM(data_in,DBN.RBM{i});
    data_in=input_rbm;
    sortie{i}=data_in;
end
proba_out=calcul_softmax(DBN.RBM{length(DBN.RBM)}, data_in);
sortie{end+1}=proba_out;

end

