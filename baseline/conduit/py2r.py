import json
import numpy as np
import pandas as pd
from joblib import dump, load
from sklearn.linear_model import LinearRegression

def load_model(fname):

    mdl = load(fname)

    return(mdl)

if __name__=="__main__":
    pass
