import numpy as np
cimport numpy as np
import cython
import time

#@cython.boundscheck(False)  # turn off array bounds checking for speed
#@cython.wraparound(False)   # turn off reverse indexing for speed

cpdef chk():
    t0 = time.time()
    cdef int i,a,N = 1000
    cdef np.ndarray[int,ndim=2] x = np.zeros((N,N),dtype=int)
    x = func(x,N)
    for i in range(N):
        a = np.sum(x)
    print time.time()-t0

cpdef func(x,int N):
    cdef int i,j
    for i in range(N):
        for j in range(N):
            x[i,j] = i
    return x