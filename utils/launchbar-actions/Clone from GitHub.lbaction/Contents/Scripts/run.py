import sys
import subprocess
import custom_env

subprocess.call([custom_env.clone_from_github, sys.argv[1]], shell = False)
