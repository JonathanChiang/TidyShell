```
import json 
import numpy as np
import pandas as pd
from sklearn.linear_model import LinearRegression

model_create = {
    "lin_reg": LinearRegression()
             }

model_predict = {     
     # Linear Regression assumes the intercept is the first item in either a row or column vector
    "lin_reg": lambda x, y: np.matmul(np.hstack((np.ones((x.shape[0], 1)), 
                                                          x.values)), y.weights.values)
             }
             
def get_weights(model, features):

    df_params = pd.DataFrame(np.concatenate((model.intercept_, model.coef_[0])), 
                                              columns = ['weights'])
    df_params["features"] = ['intercept'] + list(features)
    df_params = df_params.iloc[:, [1, 0]]


def predict_from_params(df, params, model = "lin_reg"):
    
    predictions = model_dict[model](df, params)
    
    return(predictions)
    
def train(X, y, model = "lin_reg"):
   
    mdl = model_create[model]
    mdl.fit(X, y)
    df_params = get_weights(mdl, X.columns)
    
    return(df_params)

if __name__=="__main__":
    pass
```

```
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
```
