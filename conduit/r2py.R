library(reticulate)
library(tidyverse)

mdl <- lm("Petal.Width ~ . - Species", iris)
rmse <- sqrt(sum(mdl$residuals^2)/length(mdl$residuals)) # 0.1893
save(mdl, file = "clf_iris.rda")

repl_python()

import numpy as np
import pandas as pd

iris = pd.read_csv("https://bit.ly/2ow0oJO")
X = iris.drop(["petal_width", "species"], axis = 1)
y = iris.petal_width

print(r.mdl)

exit


