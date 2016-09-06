#!/bin/zsh

# Replace spaces by slashes (to create a project name from an author and a project name)
projectify() {
	echo "$*" | sed "s, ,/,g"
}

# Replace slashes by dashes (format for project filenames)
projectfilename() {
	echo "$*" | sed "s,/,-,g"
}

has_terminal_running() {
	running_terms=$(ps aux | grep 'Terminal|konsole' | wc -l)
	# There's always the process that corresponds to the grep, therefore
	# we need to have at least two processes
	if [[ $running_terms -gt 1 ]]; then
		return 1
	else
		return 0
	fi
}

linux_only() {
    case $(uname -o) in
        "GNU/Linux")
            return 0
            ;;
        *)
            caller=$funcstack[2]
            echo "Function '$caller' should only be called from a Linux environment."
            exit 1
            ;;
    esac
}

in_temp_file() {
    linux_only
    filename=$(tempfile)
    echo "$*" > "$filename"
    echo "$filename"
}

. "$HOME/.mini-env"

export PROJECTS_INFOS="$PROJECTS/.projects"
export DEFAULT_PROJECT="$PROJECTS_INFOS/default.sublime-project"

export projectify
export projectfilename
export has_terminal_running

export PATH=".:/Applications/Sublime Text.app/Contents/SharedSupport/bin:$PATH"
