"""
This module is used for profiling a Cython script
"""

import pstats, cProfile

cProfile.runctx('MetropolisPeriodic_Cython_v1.SimRun()', globals(), locals(), "Profile.prof")
s = pstats.Stats("Profile.prof")
s.strip_dirs().sort_stats("time").print_stats()