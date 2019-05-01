## Overview

Collaborative project to Create Bash Command Utilities for Federated Model Training and Model Serialization

## Initial Goals 

- Share Scikit learn models made in python in a python REPL (sharing the python's object sessions) Sharing that object into an R session, and see if one can make predictions based off the "serialized" python module.
*[Gordon Finished]*

- Share a basic pytorch mnist model built in python and serialized to R
*[Backlog?]*

- working proof of concept of rpy2 *[Gordon Finished]*

- document work being done in blog post and R/Python community feedback *[Finished (recieved top post on Rstats)]*

- Try out pysyft and pytorch

## Roadmap Ideas 

* document requirements and dependencies in anticipation of creating a R/python virtual environment and/or docker (less priority)?? 

* publish pre-print on arxiv

* Utilize apache arrow and parquet to serialize objects for in-memory and on-disk. This would help provide a way to bridge pandas and tidy dataframes. 

* allow easier cloud connections (auth_file locations as environment variables that you have to log into) (single sign on ide) 

* Create a dedicated IDE for Federated Learning and Secure Model Communication In Healthcare setting? 

