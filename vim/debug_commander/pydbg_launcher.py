import time
import os
import sys

time.sleep(1)

DEBUGGER_LOCATION = "/home/perry/work/git/PerryUtils/systemConfigNotes/scripts/pydebug/pydbgp"
cmd = "python -S %s -d localhost:9000 %s" % (DEBUGGER_LOCATION, sys.argv[1])
os.system(cmd)
