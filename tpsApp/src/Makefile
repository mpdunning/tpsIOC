TOP=../..

include $(TOP)/configure/CONFIG

PROD_IOC = tps

DBD += tps.dbd

tps_DBD += base.dbd
tps_DBD += stream.dbd
tps_DBD += asyn.dbd
tps_DBD += asSupport.dbd
#tps_DBD += calcSupport.dbd
tps_DBD += drvAsynIPPort.dbd

tps_SRCS += tps_registerRecordDeviceDriver.cpp
tps_SRCS_DEFAULT += tpsMain.cpp

tps_LIBS += asyn
tps_LIBS += autosave
tps_LIBS += stream
#tps_LIBS += calc

tps_LIBS += $(EPICS_BASE_IOC_LIBS)

include $(TOP)/configure/RULES

