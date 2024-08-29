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
    
    ret =  np.squeeze(np.array([[p[0,...]*q[0,...] - p[1,...]*q[1,...] - p[2,...]*q[2,...] - p[3,...]*q[3,...]],
                                [p[0,...]*q[1,...] + p[1,...]*q[0,...] + p[2,...]*q[3,...] - p[3,...]*q[2,...]],
                                [p[0,...]*q[2,...] - p[1,...]*q[3,...] + p[2,...]*q[0,...] + p[3,...]*q[1,...]],
                                [p[0,...]*q[3,...] + p[1,...]*q[2,...] - p[2,...]*q[1,...] + p[3,...]*q[0,...]]]))
    
    if pFlag and qFlag:
        ret = np.transpose(ret)
    
    return ret

def qNorm(q: np.array) -> float:
    sz = q.shape
    if sz[0] == 1 or sz[0] > 4:
        q = np.transpose(q)

    return np.sqrt(q[0,...]**2 + q[1,...]**2 + q[2,...]**2 + q[3,...]**2)

def qNormalize(q: np.array) -> np.array:
    sz = q.shape
    flag = False
    if sz[0] == 1 or sz[0] > 4:
        flag = True
        q = np.transpose(q)
    
    qn = qNorm(q)
    ret = q/qn

    if flag:
        ret = np.transpose(ret)

    return ret

def qConj(q: np.array) -> np.array:
    sz = q.shape
    flag = False
    if sz[0] == 1 or sz[0] > 4:
        flag = True
        q = np.transpose(q)

    ret = q
    ret[1:4,...] = -ret[1:4,...]

    if flag:
        ret = np.transpose(ret)

    return ret

def qInv(q: np.array) -> np.array:
    sz = q.shape
    flag = False
    if sz[0] == 1 or sz[0] > 4:
        flag = True
        q = np.transpose(q)

    ret = qConj(q)/(qNorm(q)**2)

    if flag:
        ret = np.transpose(ret)

    return ret

def q2eul(q:np.array) -> np.array:
    sz = q.shape
    flag = False
    if sz[0] == 1 or sz[0] > 4:
        flag = True
        q = np.transpose(q)

    test = np.asin(2*(q[0,...]*q[2,...] - q[1,...]*q[3,...]))

    ret =  np.array([[np.atan2(2*(q[0,...]*q[1,...] + q[2,...]*q[3,...]), 1 - 2*(q[1,...]**2 + q[2,...]**2))],
                     [np.asin(2*(q[0,...]*q[2,...] - q[1,...]*q[3,...]))],
                     [np.atan2(2*(q[0,...]*q[3,...] + q[1,...]*q[2,...]), 1 - 2*(q[2,...]**2 + q[3,...]**2))]])
    
    if flag:
        ret = np.transpose(ret)

    return ret

def eul2q(eul:np.array) -> np.array:
    sz = eul.shape
    flag = False
    if sz[0] == 1 or sz[0] > 4:
        flag = True
        eul = np.transpose(eul)

    ss = np.sin(eul/2)
    cc = np.cos(eul/2)

    ret = np.squeeze(np.array([[cc[0,...]*cc[1,...]*cc[2,...] + ss[0,...]*ss[1,...]*ss[2,...]],
                               [ss[0,...]*cc[1,...]*cc[2,...] - cc[0,...]*ss[1,...]*ss[2,...]],
                               [cc[0,...]*ss[1,...]*cc[2,...] + ss[0,...]*cc[1,...]*ss[2,...]],
                               [cc[0,...]*cc[1,...]*ss[2,...] - ss[0,...]*ss[1,...]*cc[2,...]]]))
    
    if flag:
        ret = np.transpose(ret)

    return ret

def q2DCM(q:np.array) -> np.array:
    sz = q.shape
    if sz[0] == 1 or sz[0] > 4:
        q = np.transpose(q)
    sz = q.shape

    if len(sz) > 1:
        ret = np.zeros([3,3,sz[1]])
        for i in range(0,sz[1]):
            ret[...,...,i] = np.array([[(q[0,i]**2 + q[1,i]**2 - q[2,i]**2 - q[3,i]**2), 2*(q[1,i]*q[2,i] - q[0,i]*q[3,i]), 2*(q[1,i]*q[3,i] + q[0,i]*q[2,i])],
                                       [2*(q[1,i]*q[2,i] + q[0,i]*q[3,i]), (q[0,i]**2 - q[1,i]**2 + q[2,i]**2 - q[3,i]**2), 2*(q[2,i]*q[3,i] - q[0,i]*q[1,i])],
                                       [2*(q[1,i]*q[3,i] - q[0,i]*q[2,i]), 2*(q[2,i]*q[3,i] + q[0,i]*q[1,i]), (q[0,i]**2 - q[1,i]**2 - q[2,i]**2 + q[3,i]**2)]])
    else:
        ret = np.zeros([3,3,1])
        ret = np.array([[(q[0]**2 + q[1]**2 - q[2]**2 - q[3]**2), 2*(q[1]*q[2] - q[0]*q[3]), 2*(q[1]*q[3] + q[0]*q[2])],
                                [2*(q[1]*q[2] + q[0]*q[3]), (q[0]**2 - q[1]**2 + q[2]**2 - q[3]**2), 2*(q[2]*q[3] - q[0]*q[1])],
                                [2*(q[1]*q[3] - q[0]*q[2]), 2*(q[2]*q[3] + q[0]*q[1]), (q[0]**2 - q[1]**2 - q[2]**2 + q[3]**2)]])
    return ret

def DCM2q(DCM:np.array) -> np.array:
    return np.array([[np.sqrt(0.25*(1 + DCM[0,0,...] + DCM[1,1,...] + DCM[2,2,...]))],
                     [np.sqrt(0.25*(1 + DCM[0,0,...] - DCM[1,1,...] - DCM[2,2,...]))],
                     [np.sqrt(0.25*(1 - DCM[0,0,...] + DCM[1,1,...] - DCM[2,2,...]))],
                     [np.sqrt(0.25*(1 - DCM[0,0,...] - DCM[1,1,...] + DCM[2,2,...]))]])