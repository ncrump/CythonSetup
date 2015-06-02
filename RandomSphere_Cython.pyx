"""
Generates random uniformly distributed points on the surface of a sphere.
"""

import numpy as np
cimport numpy as np
import cython

@cython.boundscheck(False)  # turn off array bounds checking for speed
@cython.wraparound(False)   # turn off reverse indexing for speed

#-------------------------------------------------------------------
# N = number of random points
# r = sphere radius
#-------------------------------------------------------------------
cpdef RandomSphere(int N, float r):
    cdef float pi = 3.1415926535
    cdef np.ndarray[dtype=double,ndim=1] theta0 = np.random.uniform(-1.0,1.0,N)
    cdef np.ndarray[dtype=double,ndim=1] phi = np.random.uniform(0,2.0*pi,N)
    cdef np.ndarray[dtype=double,ndim=1] theta = np.arccos(theta0)
    cdef np.ndarray[dtype=double,ndim=1] x = r*np.sin(theta)*np.cos(phi)
    cdef np.ndarray[dtype=double,ndim=1] y = r*np.sin(theta)*np.sin(phi)
    cdef np.ndarray[dtype=double,ndim=1] z = r*np.cos(theta)
    return x,y,z