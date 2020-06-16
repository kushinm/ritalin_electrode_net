function(d, strt=1, wlen=100, wsz=1000){
	nelec <- floor(dim(d)[2]/wsz)
	nitems <- dim(d)[1]
	o <- d[,c(strt:(strt+wlen-1))]
	for(i in c(2:nelec)) o <- cbind(o, d[,c(strt:(strt + wlen-1))+(wsz*(i-1))])
	o
}