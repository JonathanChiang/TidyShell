## Overview

Project to Create bash utilities for federated model training and serialization.

## Initial Goals 

- [x] Share Scikit learn models made in python in a python REPL (sharing the python's object sessions) Sharing that object into an R session, and see if one can make predictions based off the "serialized" python module.

- [x] Working proof of concept of rpy2

- [x] Document work being done in blog post and R/Python community feedback *[(recieved top post on Rstats)]*

- [x] Try out pysyft and pytorch

- [x] Build Atom-based IDE on top of radian (installed terminal and radian) 

- [ ] TidyTensors: Allow R users to be first class citizens to pytorch infrastracture 

## Road Map

*  Objects with metadata: Attach an object's history so it can be accessed when transferred

* Document requirements and dependencies in anticipation of creating a R/python virtual environment and/or docker (less priority)??

* Publish pre-print on arxiv

* Utilize apache arrow and parquet to serialize objects for in-memory and on-disk. This would help provide a way to bridge pandas and tidy dataframes. 

* Allow easier cloud connections (auth_file locations as environment variables that you have to log into) (single sign on ide) 

* Create a dedicated IDE for Federated Learning and Secure Model Communication In Healthcare setting?

* Access objects from either an R or Python process when both are running. 


