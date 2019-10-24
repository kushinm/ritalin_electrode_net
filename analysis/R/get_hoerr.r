function(x, y, pho = 0.1, a = 1, pflag = F){
  #x = data matrix
  #y = labels
  #pho = proportion of items to hold out
  #a = alpha (mixing proportion) for elastic net. 1 is lasso, 0 is ridge
  
  nipcl <- length(y)/2 #number of items per class
  x <- x[order(y),]    #Sort data to make classes contiguous
  y <- y[order(y)]     #Sort labels to make classes contiguous
  
  #below creates a "shuffled" vector used to select hold-outs with equal numbers
  #of items held out from each class
  s <- c(c(1:nipcl)[order(runif(nipcl))], c(1:nipcl)[order(runif(nipcl))])
  nfolds <- floor(1/pho) #Compute number of folds as 1/proportion of holdouts
  nhos <- pho * nipcl    #Number of held-out items per class
  o <- rep(NA, times = nfolds)  #Vector to hold output

  for(i1 in c(1:nfolds)){
    tsmin <- (i1-1)*nhos + 1 #Minimum index for test-set in each fold
    tsmax <- i1*nhos         #Maximum index for test-set in each fold

    xtrn <- x[(s < tsmin) | (s > tsmax),] #Training set
    ytrn <- y[(s < tsmin) | (s > tsmax)]  #Training labels
    
    xtst <- x[(s >= tsmin) & (s <= tsmax),]  #Testing set
    ytst <- y[(s >= tsmin) & (s <= tsmax)]   #Testing labels
    
    #Fit the model
    m <- cv.glmnet(xtrn, ytrn, family="binomial", alpha = a)
    
    if(pflag) plot(m) #Plot error curve if plot flag is true
    
    p <- predict(m, xtst) #Generate predictions of best model for test set
    p <- as.numeric(p > 0) #Convert to binary rep for comparison to true labels
    o[i1] <- sum(p==ytst)/length(ytst)  #compute and store proportion correct for test set
  }
 o #return vector of hold-out accuracy for each fold 

}