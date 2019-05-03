function [ mat ] = lire_alpha_digit( labels, dat,classlabels)
%UNTITLED2 Summary of this function goes here
%   Detailed explanation goes here
siz=size(dat);
siz2=size(dat{1,1});
for (i=1:length(labels))
    k=(i-1)*siz(2);
    [truefalse, index]=ismember(labels(i), classlabels);
    
    for j=1: siz(2)
        mat(j+k,:)=reshape(double(dat{index,j}),1,siz2(1)*siz2(2));
    end
end


end

