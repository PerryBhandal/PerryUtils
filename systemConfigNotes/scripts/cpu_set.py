import sys, os
assert len(sys.argv) == 2

assert sys.argv[1] in ["performance", "powersave"]

for i in range(0, 3):
    os.system("sudo cpufreq-set -c %d -g %s" % (i, sys.argv[1]))
