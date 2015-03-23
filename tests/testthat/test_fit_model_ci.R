context("fit a poisson glmer with confidence intervals")
describe("fit_model_ci", {
  set.seed(123456789)
  n.random <- 100
  n.rep <- 10
  sd.random <- 2
  intercept <- 1
  trend <- 0.1
  the.data <- data.frame(
    X = runif(n.rep * n.random),
    ID = factor(seq_len(n.random))
  )
  random.effect <- rnorm(n.random, mean = 0, sd = sd.random)
  the.data$Eta <- intercept + trend * the.data$X + random.effect[the.data$ID]
  the.data$Y <- rpois(nrow(the.data), lambda = exp(the.data$Eta))
  output <- fit_model_ci(formula = Y ~ X + (1|ID), dataset = the.data)
})
