library(reticulate)
#library(assertthat)

# can install library assertthat for testing 

# shell commands 
# pip install pandas 

# opens up python REPL in R with Reticulate 
# https://rstudio.github.io/reticulate/reference/repl_python.html

repl_python()
import pandas as pd

# create a dictionary in Python 
fruit = dict({"first fruit" : "apple", "second fruit " : "pear", "third fruit" : "pineapple"})

# referencing this stack overflow post 
# https://stackoverflow.com/questions/18837262/convert-python-dict-into-a-dataframe

d = {u'2012-06-08': 388,
  u'2012-06-09': 388,
  u'2012-06-10': 388,
  u'2012-06-11': 389,
  u'2012-06-12': 389,
  u'2012-06-13': 389,
  u'2012-06-14': 389,
  u'2012-06-15': 389,
  u'2012-06-16': 389,
  u'2012-06-17': 389,
  u'2012-06-18': 390,
  u'2012-06-19': 390,
  u'2012-06-20': 390}
data = pd.DataFrame(d.items(), columns=['Date', 'DateValue'])

exit

# you can call python objects after exiting by 
# py$[OBJECT SAVED IN PY REPL ]

# calling python object in R 
# converts to list 
# need to figure order of lists in python aren't the same (bug?)
fruit.list <- py$fruit


fruit.list[["first fruit"]]
date <- py$data
date

#assertthat::are_equal(str(date), str(py$data))

