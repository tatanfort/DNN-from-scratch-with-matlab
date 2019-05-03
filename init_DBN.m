function [ DBN ] = init_DBN( tailleReseau )
 DBN=struct();
for i=1:length(tailleReseau)-1
    DBN.RBM{i}=init_RBM(tailleReseau(i), tailleReseau(i+1));
end


