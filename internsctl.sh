!/bin/bash

# Function to display help information
display_help() {
    echo "Usage: internsctl [OPTIONS] [COMMAND]"
    echo "Options:"
    echo "  --help       Display help information and examples"
    echo "  --version    Display command version"
    # Add more information about commands, their usage, and options
}

# Check if --help option is passed
if [[ $1 == "--help" ]]; then
    display_help
    exit 0
fi

# Display command version
if [[ $1 == "--version" ]]; then
    echo "internsctl v0.1.0"
    exit 0
fi
#!/bin/bash

# Get CPU information
if [[ $1 == "cpu" && $2 == "getinfo" ]]; then
    lscpu
    exit 0
fi

# Get memory information
if [[ $1 == "memory" && $2 == "getinfo" ]]; then
    free -h
    exit 0
fi
#!/bin/bash

# Create a new user
if [[ $1 == "user" && $2 == "create" ]]; then
    username=$3
    sudo adduser $username
    exit 0
fi

# List all regular users
if [[ $1 == "user" && $2 == "list" ]]; then
    getent passwd | grep -v '/false' | cut -d: -f1
    exit 0
fi

# List users with sudo permissions
if [[ $1 == "user" && $2 == "list" && $3 == "--sudo-only" ]]; then
    getent group sudo | cut -d: -f4 | tr ',' '\n'
    exit 0
fi
#!/bin/bash

# Function to get file information
get_file_info() {
    file=$1

    # Get file details
    file_name=$(basename $file)
    access=$(ls -l $file | cut -d ' ' -f1)
    size=$(stat -c%s $file)
    owner=$(stat -c%U $file)
    modify=$(stat -c%y $file)

    # Display file information
    echo "File: $file_name"
    echo "Access: $access"
    echo "Size(B): $size"
    echo "Owner: $owner"
    echo "Modify: $modify"
}

# Get file information based on command input
if [[ $1 == "file" && $2 == "getinfo" ]]; then
    file=$3

    get_file_info $file
    exit 0
fi


# Get file information based on options
if [[ $1 == "file" && $2 == "getinfo" ]]; then
    file=$3
    option=$4

    if [[ ! -z $option ]]; then
        get_file_info $file $option
    else
        # Default output if no option specified
        stat $file
    fi
    exit 0
fi

#!/bin/bash

# Function to get specific file information based on options
get_specific_file_info() {
    file=$1
    option=$2

    case $option in
        --size|-s)
            stat -c%s $file
            ;;
        --permissions|-p)
            ls -l $file | awk '{print $1}'
            ;;
        --owner|-o)
            stat -c%U $file
            ;;
        --last-modified|-m)
            stat -c%y $file
            ;;
        *)
            echo "Invalid option"
            ;;
    esac
}

# Get specific file information based on command input
if [[ $1 == "file" && $2 == "getinfo" ]]; then
    file=$4
    option=$3

    if [[ ! -z $option && ! -z $file ]]; then
        get_specific_file_info $file $option
    else
        echo "Usage: internsctl file getinfo [options] <file-name>"
    fi
    exit 0
fi
