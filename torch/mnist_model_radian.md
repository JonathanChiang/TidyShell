Using a trained pytorch model in R via radian.

r$> library(reticulate)

>>> #python mode
>>> import torch
>>> import torch.nn as nn
>>> import torch.nn.functional as F
>>> import torch.optim as optim
>>> from torchvision import datasets, transforms
>>> import torch_syft as ts #torch helper objects and functions
>>> device = torch.device("cpu")
>>> model_ld = Net().to(device)
>>> model_ld.load_state_dict(torch.load("../models/mnist_cnn.pt"))
>>> model_ld.eval()
>>> dataiter = iter(test_loader)
>>> images, labels = dataiter.next()
>>> y_pred = model_ld(images)
>>> y_pred[0].data.cpu().numpy().argmax(axis = 0) #prediction

r$> preds = py$model_ld(py$images)
r$> preds[1]$data$cpu()$numpy()$argmax(axis = 0) #throws error
r$> which.max(preds[1]$data$cpu()$numpy()) #gives prediction

 

