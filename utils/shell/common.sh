#!/bin/zsh

# Replace spaces by slashes (to create a project name from an author and a project name)
projectify() {
	echo "$*" | sed "s, ,/,g"
}

# Replace slashes by dashes (format for project filenames)
projectfilename() {
	echo "$*" | sed "s,/,-,g"
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

export projectify
export projectfilename
