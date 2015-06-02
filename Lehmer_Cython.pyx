"""
Generates random uniform numbers in the interval [0,1]
"""
import numpy as np
cimport numpy as np

# Lehmer modulo generator
#-----------------------------------------------------------
# seed = initial seed to start the random sequence
# n = how many random numbers to generate in array
#-----------------------------------------------------------
cpdef Lehmer(float seed, int n):

    # define constants
    cdef float a = 16807.0
    cdef float xm = 2147483647.0
    cdef float x0 = 2147483711.0
    cdef int i

    # array to store random numbers
    cdef np.ndarray[dtype=double,ndim=1] rand = np.zeros(n,dtype=float)

    # loop to generate random numbers
    for i in range(n):
        seed = (a*seed) % xm
        rand[i] = seed/x0

    return rand
