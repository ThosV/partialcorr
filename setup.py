#!/usr/bin/env python3
"""
Created on Monday October 8, 2018
@author: thosvarley
"""
from distutils.core import setup, Extension
from Cython.Build import cythonize
import numpy

setup(
    ext_modules=cythonize("partialcorr.pyx", annotate = True),
    include_dirs=[numpy.get_include()]
) 
