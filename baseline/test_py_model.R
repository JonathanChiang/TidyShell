# mdl1: Create model in language X, write to disk, and load in language Y
# mdl2: Create model in X and access in Y
# mdl3: Create model in X with data from Y and then access in Y
# mdl4: Transfer model object from X to Y and then create in Y
# mdl5: Create X model completely in Y.

# Python model serialization

# import numpy as np
# import pandas as pd
# from sklearn.linear_model import LogisticRegression as LogReg
# from joblib import dump, load
# 
# iris = pd.read_csv("https://bit.ly/2ow0oJO")
# mdl = LogReg()
# mdl.fit(iris.drop(["species"], axis = 1), iris.species)
# dump(mdl, "clf_iris.joblib")

library(tidyverse)
library(reticulate)

reticulate::source_python("conduit/py2r.py")

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

mdl4 = LogReg()

exit

py$mdl2$score(X, y)
py$mdl3$score(X, y)

py$mdl4$fit(X, y)
py$mdl4$score(X, y)

sk_lm <- reticulate::import("sklearn.linear_model", delay_load = TRUE)
mdl5 = sk_lm$LogisticRegression()
mdl5$fit(X, y)
mdl5$score(X, y)
