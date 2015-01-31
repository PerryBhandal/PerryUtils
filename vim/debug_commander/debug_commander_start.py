import vim
import os

LAUNCHER_PATH = "/home/perry/.vim/plugin/pydbg_launcher.py"

fileName = vim.eval("expand('%:t')")
fullPath = vim.eval("expand('%:p')")

os.system("python %s %s &" % (LAUNCHER_PATH, fullPath))

vim.command(":VdebugStart")
