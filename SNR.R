set.seed(345)


var_1 <- c()
var_2 <- c()
var_3 <- c()
var_4 <- c()
var_5 <- c()
var_6 <- c()
var_7 <- c()
var_signal <- c()
var_noise <- c()
var_Y <- c()

# SNR simulation, takes some minutes.
for (run in 1:30) {
n <- 10000000

X1 <- rnorm(n)
X2 <- rnorm(n)
X3 <- rnorm(n)
X4 <- rnorm(n)
X5 <- rnorm(n)
X6 <- rnorm(n)

term1 <- X1
term2 <- 0.707 * X2^2
term3 <- 2 * (X3 > 0)
term4 <- 0.873 * log(abs(X1)) * X3
term5 <- 0.894 * X2 * X4
term6 <- 2 * (X5 > 0)
term7 <- 0.464 * exp(X6)

signal <- term1 + term2 + term3 + term4 + term5 + term6 + term7

epsilon <- rnorm(n)
Y <- signal + epsilon

var_1 <- c(var_1, var(term1))
var_2 <- c(var_2, var(term2))
var_3 <- c(var_3, var(term3))
var_4 <- c(var_4, var(term4))
var_5 <- c(var_5, var(term5))
var_6 <- c(var_6, var(term6))
var_7 <- c(var_7, var(term7))
var_noise <- c(var_noise, var(epsilon))
var_signal <- c(var_signal, var(signal))
var_Y <- c(var_Y, var(Y))
}

# Mean signal-to-noise ratio of 30 simulations, all with 10 million observations
cat("Variance breakdown:\n")
cat(mean(var_1), mean(var_2), mean(var_3), mean(var_4), mean(var_5), mean(var_6), mean(var_7))
cat(sprintf("Noise (epsilon): %.3f\n", mean(var_noise)))
cat(sprintf("Total Signal Variance: %.3f\n", mean(var_signal)))
cat(sprintf("Total Y Variance: %.3f\n", mean(var_Y)))
cat(sprintf("Signal to noise: %.3f\n", mean(var_signal) / mean(var_noise)))