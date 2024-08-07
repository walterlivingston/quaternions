import numpy as np
from collections import namedtuple

EULER321 = namedtuple('EULER321', ['r','p','y'])

def qMult(p: np.array, q:np.array) -> np.array:
    szp = p.shape
    szq = q.shape
    pFlag = qFlag = False
    if szp[0] == 1 or szp[0] > 4:
        pFlag = True
        p = np.transpose(p)
    if szq[0] == 1 or szq[0] > 4:
        qFlag = True
        q = np.transpose(q)
    if p.shape != q.shape:
        raise Exception('Size of p & q must be equal!')
    
    return np.squeeze(np.array([[p[0,...]*q[0,...] - p[1,...]*q[1,...] - p[2,...]*q[2,...] - p[3,...]*q[3,...]],
                                [p[0,...]*q[1,...] + p[1,...]*q[0,...] + p[2,...]*q[3,...] - p[3,...]*q[2,...]],
                                [p[0,...]*q[2,...] - p[1,...]*q[3,...] + p[2,...]*q[0,...] + p[3,...]*q[1,...]],
                                [p[0,...]*q[3,...] + p[1,...]*q[2,...] - p[2,...]*q[1,...] + p[3,...]*q[0,...]]]))

def qNorm(q: np.array) -> float:
    sz = q.shape
    if sz[0] == 1 or sz[0] > 4:
        q = np.transpose(q)

    return np.sqrt(q[0,...]**2 + q[1,...]**2 + q[2,...]**2 + q[3,...]**2)

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

q = np.array([1, 0, 0, 0])
print(qNorm(q))