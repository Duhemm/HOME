#!/usr/bin/python
# Please make me available system-wide
# Run `python -c "from distutils.sysconfig import *; print(get_python_lib())"`
# to know where to copy me.
from os.path import join

projects = "/Users/martin/Documents/Projects.nosync"
scripts = "/Users/martin/utils/shell"

my_username = "Duhemm"

github_token = ""

open_project = join(scripts, "open-project")
open_sublime_project = join(scripts, "open-sublime-project")
open_vim_project = join(scripts, "open-vim-project")

clone_from_github = join(scripts, "clone-github")
