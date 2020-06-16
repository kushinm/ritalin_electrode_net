function(d, y, n=20, nelec=8, wlen=100, shft=50){
	t <- floor(dim(d)[2]/nelec)
	t <- floor((t - wlen)/shft)
	o <- matrix(0, t, n)
	for(i in c(1:t)){
		w <- get.melec(d, strt = (i-1)*shft + 1, wlen=wlen, wsz=floor(dim(d)[2]/nelec))
		currcv <- get.cv(w, y, n)
		o[i,] <- currcv[,1]
		}
	o
}
