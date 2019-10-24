function(x){
  #This function removes columns with an NA value from the matrix
  x <- as.matrix(x) #make sure it's a matrix
  s <- c(1:dim(x)[2])[!is.na(colSums(x))] #Vector of columns without NA values
  x[,s] #Return matrix with only those columns
}