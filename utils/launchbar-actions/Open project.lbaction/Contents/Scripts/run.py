import sys
import subprocess
import custom_env

subprocess.call([custom_env.open_sublime_project, sys.argv[1]], shell = False)
