"""
Generates positions on face centered cubic (FCC) lattice
"""

import numpy as np
cimport numpy as np

#-------------------------------------------------------------------
# d = distance between atoms
# N = number of times to translate cell to form lattice
#-------------------------------------------------------------------
cpdef FCC(float d, int N):
    # get translation step of cube
    cdef float a = d*(2.0**0.5)
    cdef float xi,yi,zi
    cdef np.ndarray[dtype=double,ndim=1] steps = np.linspace(a, a*N, N)

    # get initial unit cell positions
    cdef np.ndarray[dtype=double,ndim=1] x = np.array([0,1,0,1],dtype=float)*0.5*a
    cdef np.ndarray[dtype=double,ndim=1] y = np.array([0,1,1,0],dtype=float)*0.5*a
    cdef np.ndarray[dtype=double,ndim=1] z = np.array([0,0,1,1],dtype=float)*0.5*a

    # shift first atom slightly out of position
    # used for MD sim to get system moving
    #  ** (TURN OFF OTHERWISE) **
    #x[0],y[0],z[0] = 0.01,-0.01,0.05

    # translate in x direction
    for xi in steps:
        x = np.append(x,x[0:4]+xi)
        y = np.append(y,y[0:4])
        z = np.append(z,z[0:4])

    # translate in y direction
    for yi in steps:
        x = np.append(x,x[0:4*(N+1)])
        y = np.append(y,y[0:4*(N+1)]+yi)
        z = np.append(z,z[0:4*(N+1)])

    # translate in z direction
    for zi in steps:
        x = np.append(x,x[0:4*(N+1)**2])
        y = np.append(y,y[0:4*(N+1)**2])
        z = np.append(z,z[0:4*(N+1)**2]+zi)

    return x,y,z