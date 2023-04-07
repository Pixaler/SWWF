@echo off
powercfg -import "C:\Files\Packages\Power.pow" 77777777-7777-7777-7777-777777777777
powercfg -SETACTIVE "77777777-7777-7777-7777-777777777777"
powercfg -delete 381b4222-f694-41f0-9685-ff5bb260df2e
powercfg -delete 8c5e7fda-e8bf-4a96-9a85-a6e23a8c635c 
powercfg -delete a1841308-3541-4fab-bc81-f71556f20b4a
powercfg -attributes SUB_PROCESSOR 75b0ae3f-bce0-45a7-8c89-c9611c25e100 -ATTRIB_HIDE
powercfg -setdcvalueindex SCHEME_CURRENT 54533251-82be-4824-96c1-47b60b740d00 75b0ae3f-bce0-45a7-8c89-c9611c25e100 3000
powercfg -setacvalueindex SCHEME_CURRENT 54533251-82be-4824-96c1-47b60b740d00 75b0ae3f-bce0-45a7-8c89-c9611c25e100 3000
powercfg -change -monitor-timeout-ac 20
powercfg -change -monitor-timeout-dc 20
powercfg -h off
