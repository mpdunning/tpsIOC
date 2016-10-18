#!../../bin/linux-x86_64/tps

epicsEnvSet( "STREAM_PROTOCOL_PATH","../../tpsApp/Db:.")

< envPaths

cd ${TOP}

dbLoadDatabase "dbd/tps.dbd"
tps_registerRecordDeviceDriver pdbbase

epicsEnvSet("N",    "01")
epicsEnvSet("P",    "ESB:TPS$(N)")
epicsEnvSet("DESC", "O'Shamber TPS")

save_restoreSet_status_prefix( "")
save_restoreSet_IncompleteSetsOk( 1)
save_restoreSet_DatedBackupFiles( 1)
set_savefile_path( "/nfs/slac/g/testfac/esb/$(IOC)","autosave")
set_pass0_restoreFile( "tps.sav")
set_pass1_restoreFile( "tps.sav")

drvAsynIPPortConfigure ("L0","ts-esb-01:2006",0,0,0)

#asynSetTraceMask("L0",-1,0x019)
#asynSetTraceIOMask("L0",-1,0x2)

dbLoadRecords("db/tps.db","P=$(P),IOC=$(IOC),DESC=$(DESC),PORT=L0")

cd ${TOP}/iocBoot/${IOC}
iocInit()

create_monitor_set( "tps.req",30,"P=$(P)")
