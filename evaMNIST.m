function [error_rate_train,error_rate_test]=evaMNIST(dbn,train_data,train_labels,test_data,test_labels)


rmse= CalcRmse(dbn, train_data, train_labels);
error_rate_train= CalcErrorRate(dbn, train_data, train_labels);
fprintf( 'For training data:\n' );
fprintf( 'rmse: %g\n', rmse );
fprintf( 'ErrorRate: %g\n', error_rate_train);

rmse= CalcRmse(dbn, test_data, test_labels);
error_rate_test= CalcErrorRate(dbn, test_data, test_labels);
fprintf( 'For test data:\n' );
fprintf( 'rmse: %g\n', rmse );
fprintf( 'ErrorRate: %g\n', error_rate_test );

