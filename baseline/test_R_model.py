# mdl1: Create model in language X, write to disk, and load in language Y
# mdl2: Create model in X and access in Y
# mdl3: Create model in X with data from Y and then access in Y
# mdl4: Transfer model object from X to Y and then create in Y
# mdl5: Create X model completely in Y.

# R model serialization

# mdl <- lm("Petal.Width ~ . - Species", iris)
# save(mdl, "rgr_iris.rda")

import numpy as np 
import pandas as pd

import rpy2.robjects
from rpy2.robjects import r, pandas2ri
from rpy2.robjects.packages import importr

stats = importr('stats')

pandas2ri.activate()

iris = pd.read_csv("https://bit.ly/2ow0oJO")
test = iris.copy()
test.columns  = ["Sepal.Length", "Sepal.Width",  "Petal.Length", "Petal.Width", "Species"]
rdf = pandas2ri.py2rpy_pandasdataframe(test)

rpy2.robjects.r('''
f <- function() {
    model = load("rgr_iris.rda")
    #predict(get(model), X)
    return(get(model))
    }
''')

r_f = rpy2.robjects.r['f']
mdl1 = r_f() 
stats.predict(mdl1, test)

rpy2.robjects.r('''
g <- function() {
    mdl = lm("Petal.Width ~ . - Species", iris)
    return(mdl)
    }
''')

r_g = rpy2.robjects.r['g']
mdl2 = r_g() 
stats.predict(mdl2, test)

rpy2.robjects.r('''
h <- function(X) {
    mdl = lm("Petal.Width ~ . - Species", X)
    return(mdl)
    }
''')

r_h = rpy2.robjects.r['h']
mdl3 = r_h(test) 
stats.predict(mdl3, test)

# mdl4 excluded as the idea of an uninitiliazed model is mostly alien to R

mdl5 = stats.lm("Petal.Length ~ . - Species", test)
stats.predict(mdl5, test) # There might be a slight bug as the predictions look off


