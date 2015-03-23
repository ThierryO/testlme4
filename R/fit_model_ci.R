#' Fit a poisson glmer with confidence intervals on model parameters
#' @param formula the glmer formula
#' @param dataset the dataset
#' @export
#' @import lme4
fit_model_ci <- function(formula, dataset){
  model <- glmer(
    formula = formula,
    data = dataset,
    family = "poisson"
  )
  ci <- confint.merMod(model)
  return(list(model = model, confint = ci))
}
