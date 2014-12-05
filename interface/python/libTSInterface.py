#
#
#               Time-Spectral Interface for HI-ARMS
#               created by J. Leffell, 7/17/14
#
# Standard Python modules

import sys
import os
import copy
import string
import types
import numpy

#Extension modules

from numpy import *
import libTS

class libTSModule:

    def __init__(self):
	self.modulename='libTS'

    def af_update(self):
        libTS.afts_update(self.qlocal,self.slocal,self.vollocal,
                          self.myidlocal,self.ninstanceslocal,
                          self.hlocal,self.freqlocal,
                          self.tcomplocal,self.tcommlocal)

    def setData(self,data):
        self.qlocal=data['q-data']
        self.slocal=data['s-data']
        self.vollocal=data['vol-data']
        self.myidlocal=data['myid-data']
        self.ninstanceslocal=data['n-data']
        self.jmaxlocal=data['jmax-data']
        self.kmaxlocal=data['kmax-data']
        self.lmaxlocal=data['lmax-data']
        self.hlocal=data['h-data']
        self.freqlocal=data['freq-data']
        self.tcomplocal=data['tcomp_ts-data']
        self.tcommlocal=data['tcomm_ts-data']
    def finish(self):
	libTS.ts_cleanup()
