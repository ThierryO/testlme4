#' Fit a poisson glmer
#' @param formula the glmer formula
#' @param dataset the dataset
#' @export
#' @import lme4
fit_model <- function(formula, dataset){
  model <- glmer(
    formula = formula,
    data = dataset,
    family = "poisson"
  )
  return(model)
}
