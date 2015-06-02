"""
This module is used for importing Cython with Numpy
and compile Cython with MinGW at runtime.
"""

import numpy
import pyximport

pyximport.install(setup_args={"script_args":["--compiler=mingw32"],
                              "include_dirs":numpy.get_include()},
                              reload_support=True)