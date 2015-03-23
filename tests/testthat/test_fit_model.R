context("fit a poisson glmer")
describe("fit_model", {
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
  direct.model <- glmer(Y ~ X + (1|ID), data = the.data, family = poisson)
  confint(direct.model)
  model <- fit_model(formula = Y ~ X + (1|ID), dataset = the.data)
  confint(model)
})
