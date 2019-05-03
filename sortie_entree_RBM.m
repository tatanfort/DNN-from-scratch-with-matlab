function [ in ] = sortie_entree_RBM( data_out,RBM )

in=1./(1+exp(-(repmat(RBM.a,size(data_out,1),1)+data_out*(RBM.w)')));

end
