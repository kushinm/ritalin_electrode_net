function (x, y, n = 10, k = 3, a = 1, spl = c(1:30)) 
{
    o <- matrix(0, n, 2)
    for (i in c(1:n)) {
        s <- c(spl[order(runif(length(spl)))], spl[order(runif(length(spl)))])
        xtrn <- x[s > k, ]
        ytrn <- y[s > k]
        xtst <- x[s <= k, ]
        ytst <- y[s <= k]
        m <- cv.glmnet(x = xtrn, y = ytrn, family = "binomial", 
            alpha = a)
        p <- predict(m, xtst)
        o[i, 1] <- mean((p > 0) == ytst)
        o[i, 2] <- m$nzero[m$lambda == m$lambda.min]
        print(paste("Round", round(i, 2), "CVAcc:", o[i, 1], 
            "Nonzero:", o[i, 2]))
        flush.console()
    }
    o
}
