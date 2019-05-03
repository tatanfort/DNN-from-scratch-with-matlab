function [ image ] = generer_image_RBM( RBM,nbIterGibbs,nbImages,tailleImage)

for j=1:nbImages
    tirage=(rand(1,tailleImage(1)*tailleImage(2)))<1/2*ones(1,tailleImage(1)*tailleImage(2));
    for i=1:nbIterGibbs
        h=entree_sortie_RBM(tirage,RBM);
        tirage=(rand(size(h)))<h;
        v=sortie_entree_RBM(tirage,RBM);
        tirage=(rand(size(v)))<v;
    end
    image=reshape(tirage,tailleImage(1),tailleImage(2));
    figure()
    imshow(image)

end

end

