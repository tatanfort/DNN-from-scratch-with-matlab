function [ RBM,trueErr ] = trainRBM( RBM,data_in,nbIter,learningRate, batchSize)

r = randperm(size(data_in,1));
data_in=data_in(r,:);

for j=1:nbIter
    
    for i=1:batchSize:size(data_in,1)
        vis0=data_in(i:min(i+batchSize-1,size(data_in,1)),:);
        hid0=1./(1+exp(-(vis0*RBM.w+(repmat(RBM.b,size(vis0,1),1)))));
        sampleHid0=(rand(size(vis0,1),size(RBM.w,2))<hid0);
        vis1=1./(1+exp(-(sampleHid0*RBM.w'+(repmat(RBM.a,size(vis0,1),1)))));
        sample_vis1=rand(size(vis0,1),size(RBM.w,1))<vis1;
        hid1=1./(1+exp(-(sample_vis1*RBM.w+(repmat(RBM.b,size(vis0,1),1)))));
        pos=hid0'*vis0;
        neg=hid1'*sample_vis1;
        dw=(pos-neg)';
        da=sum(vis0-sample_vis1,1);
        db=sum(hid0-hid1,1);
        RBM.w=RBM.w+((learningRate*dw)/batchSize);
        RBM.a=RBM.a+((learningRate*da)/batchSize);
        RBM.b=RBM.b+((learningRate*db)/batchSize);
    end
    hv=entree_sortie_RBM(data_in,RBM);
    vh=sortie_entree_RBM(hv,RBM );
    err=power(data_in-vh,2);
    trueErr=sqrt(sum(err(:))/numel(err))
    
end