# Unfinished

library(tidyverse)
library(reticulate)

predict_from_params <- function(df, params){

  mat <- df %>%
    add_column(intercept_col = 1, .before = 1) %>%
    as.matrix()

  # params[,-1] removes the column with the feature names
  predictions <- mat %*% as.matrix(params[,-1])

  return(predictions)

}

mdl <- lm(Petal.Width ~  Petal.Length + Sepal.Width + Sepal.Length, data = iris)

mdl_params <- broom::tidy(mdl) %>%
  select(term, estimate) %>%
  rename(features = term, weights = estimate)

predict_from_params(iris[1:2,1:3], mdl_params)

