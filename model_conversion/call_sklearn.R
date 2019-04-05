library(tidyverse)
library(reticulate)

X <-iris[, 1:3]
y <- iris[, 4]

reticulate::source_python("sklearn_to_R.py")
mdl_params <- train(X, y)

predictions <- predict_from_params(iris[1:2,1:3], mdl_params)
