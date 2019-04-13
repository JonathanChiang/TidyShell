# Python side

# import numpy as np
# import pandas as pd
# from sklearn.linear_model import LogisticRegression as LogReg
# from joblib import dump, load
# 
# iris = pd.read_csv("https://bit.ly/2ow0oJO")
# mdl = LogReg()
# mdl.fit(iris.drop(["species"], axis = 1), iris.species)
# dump(mdl, "clf_iris.joblib")
# mdl.score(df.drop(["species"], axis = 1), df.species)
# 0.96

library(tidyverse)
library(reticulate)

reticulate::source_python("conduit_py/py2r.py")

X <-iris[, 1:4]
y <- iris[, 5]

mdl <- load_model("clf_iris.joblib")
mdl$score(X, y)

repl_python()

import numpy as np
import pandas as pd
from sklearn.linear_model import LogisticRegression as LogReg
from joblib import dump, load

iris = pd.read_csv("https://bit.ly/2ow0oJO")

mdl2 = LogReg()
mdl2.fit(iris.drop(["species"], axis = 1), iris.species)

mdl3 = LogReg()
mdl3.fit(r.X, r.y)

exit

py$mdl2$score(X, y)
py$mdl3$score(X, y)
