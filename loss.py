import torch

def LSD_loss(y_true, y_pred):
    #LSD is log-spectral distance
    LSD = torch.mean((y_true - y_pred)**2, axis=2)
    LSD = torch.mean(torch.sqrt(LSD), axis=1)
    return LSD
