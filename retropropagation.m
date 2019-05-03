function [dbn, rmse] = retropropagation(dbn, donnees, labels, iterations,epsilon,BatchSize)
rmse= -1;

strbm = 1;
nrbm = numel( dbn.RBM );
num = size(donnees,1);


% We repeat epochs until this criterion is not met
for iter=1:iterations

    
    %We run one epoch
    ind = randperm(num);
    for batch=1:BatchSize:num
        bind = ind(batch:min([batch + BatchSize - 1, num]));
        trainDBN = dbn;
        Hall = entree_sortie_reseau( trainDBN, donnees(bind,:) );
        
        
        for n=nrbm:-1:strbm
            derSgm = Hall{n} .* ( 1 - Hall{n} );
            if( n+1 > nrbm )
                derSgm = Hall{n} .* ( 1 - Hall{n} );
                der = ( Hall{nrbm} - labels(bind,:) );
            else
                der = derSgm .* ( der * trainDBN.RBM{n+1}.w' );
            end
            
            if( n-1 > 0 )
                in = Hall{n-1};
            else
                in = donnees(bind,:);
            end
            
            in = cat(2, ones(numel(bind),1), in);
            
            deltaWb = in' * der / numel(bind);
            deltab = deltaWb(1,:);
            deltaW = deltaWb(2:end,:);
              
    
           
            dbn.RBM{n}.w = dbn.RBM{n}.w - epsilon * deltaW;
            dbn.RBM{n}.b = dbn.RBM{n}.b - epsilon * deltab;
            
        end
        
    end
    
        out = entree_sortie_reseau( dbn, donnees );
        err = power( labels - out{nrbm}, 2 );
        rmse = sqrt( sum(err(:)) / numel(err) );
        %fprintf( '%3d : %9.4f\n', iter, rmse );
        
end
