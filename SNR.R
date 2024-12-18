set.seed(345)

var_signal <- c()
var_noise <- c()
var_Y <- c()

# SNR simulation
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

var_noise <- c(var_noise, var(epsilon))
var_signal <- c(var_signal, var(signal))
var_Y <- c(var_Y, var(Y))
}

# Mean signal-to-noise ratio of 30 simulations, all with 10 million observations
cat("Variance breakdown:\n")
cat(sprintf("Noise (epsilon): %.3f\n", mean(var_noise)))
cat(sprintf("Total Signal Variance: %.3f\n", mean(var_signal)))
cat(sprintf("Total Y Variance: %.3f\n", mean(var_Y)))
cat(sprintf("Signal to noise: %.3f\n", mean(var_signal) / mean(var_noise)))

