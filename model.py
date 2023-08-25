import torch
from torch import nn
from torch.nn import functional as F

class EncBlock(nn.Module):
    def __init__(self, in_channels, out_channels, kernel_size,
               stride, padding=None, complex=False, padding_mode="zeros"):
        super().__init__()
        self.conv = 
