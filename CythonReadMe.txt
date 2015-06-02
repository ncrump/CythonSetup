How to Run Cython Scripts
--------------------------

A C/C++ compiler is needed to compile Cython (such as gcc or MinGW for Windows)
Set the PATH environment variable to include where the Cython script lives
Cython files need the extension '.pyx' to make them Cython

These steps run a Cython '.pyx' script:
------------------------------------------------------------------------
1) Open a Python console 

2) Import the 'setup.py' script needed to compile the '.pyx' file
This loads the 'pyximport' module used to compile Cython script
>>> import numpy
>>> import pyximport
>>> pyximport.install(setup_args={"script_args":["--compiler=mingw32"],
                              "include_dirs":numpy.get_include()},
                               reload_support=True)
3) Import the Cython module 
This does the compiling and creates a '.c' file of the Cython script
My compiled '.c' files live in:
C:\Users\Code 8000\.pyxbld\temp.win32-2.7\Release\pyrex

4) Then you can call the function in the Cython file from the console
------------------------------------------------------------------------

My calling sequence in the Python(xy) console to run Cython is:
>>> import CythonSetup
>>> import MyCythonScript
>>> MyCythonScript.function()

5) To reload module after making edits
------------------------------------------------------------------------
>>> reload(MyCythonScript)
>>> MyCythonScript.function()