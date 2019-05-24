#!/usr/bin/env python3
# -*- coding: utf-8 -*-
"""
Created on Thu May 23 21:49:46 2019

@author: thosvarley
"""
import numpy as np 
cimport numpy as np 
cimport cython
from scipy.stats import pearsonr, linregress


@cython.boundscheck(False)
def partialcorr(double[:] X, double[:] Y, double[:] Z):
    """
    Returns the correlation between X and Y after controlling for Z. 
    
    X, Y, and Z must all be arrays of dtype = double and the same length. 
    """
    
    assert X.shape[0] == Y.shape[0] == Z.shape[0], "All vectors must be the same length"
    
    cdef (double, double) corrZX = tuple(linregress(Z, X)[:2])
    cdef (double, double) corrZY = tuple(linregress(Z, Y)[:2])
    cdef int N = X.shape[0]
    
    cdef double[:] residZX = np.zeros(N, dtype="double")
    cdef double[:] residZY = np.zeros(N, dtype="double")
    cdef int i
    
    for i in range(N):
        residZX[i] = X[i] - (corrZX[1] + (Z[i]*corrZX[0]))
        residZY[i] = Y[i] - (corrZY[1] + (Z[i]*corrZY[0]))
    
    cdef double pcorr = pearsonr(residZX, residZY)[0]    
    
    return (pcorr, residZX, residZY)

