import numpy as np
from collections import namedtuple

EULER321 = namedtuple('EULER321', ['r','p','y'])

def qMult(q: np.array, p:np.array) -> np.array:
    pass

def qNorm(q: np.array) -> float:
    pass

def qNormalize(q: np.array) -> np.array:
    pass

def qInverse(q: np.array) -> np.array:
    pass

def qConj(q: np.array) -> np.array:
    pass

def q2eul(q:np.array) -> EULER321:
    pass

def eul2q(eul:EULER321) -> np.array:
    pass

def q2DCM(q:np.array) -> np.array:
    pass

def DCM2q(q:np.array) -> np.array:
    pass