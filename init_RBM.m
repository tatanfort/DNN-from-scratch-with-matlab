function [RBM] = init_RBM(taille_in, taille_out)

RBM=struct();
RBM.w=randn(taille_in,taille_out)*0.1;
RBM.b=randn(1,taille_out)*0;
RBM.a=randn(1,taille_in)*0;
end

