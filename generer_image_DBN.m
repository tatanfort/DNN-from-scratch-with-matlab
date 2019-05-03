function [ image ] = generer_image_DBN( DBN,nbIterGibbs,nbImages,tailleImage,tailleReseau)
for j=1:nbImages
    tirage=(rand(1,tailleReseau(end-2)))<1/2*ones(1,tailleReseau(end-2));
    for i=1:nbIterGibbs
        h=entree_sortie_RBM(tirage,DBN.RBM{end-1});
        tirage=(rand(size(h)))<h;
        v=sortie_entree_RBM(tirage,DBN.RBM{end-1});
        tirage=(rand(size(v)))<v;
    end
    for k=(length(DBN.RBM)-2):-1:1
        [ tirage ] = sortie_entree_RBM(tirage,DBN.RBM{k});
        tirage=(rand(size(tirage)))<tirage;
    end
    image=reshape(tirage,tailleImage(1),tailleImage(2));
    figure()
    imshow(image)
end
end

