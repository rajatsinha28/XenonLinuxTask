# Section A
#!/bin/bash

function show_help {
    echo "Usage: internsctl [OPTIONS]"
    echo "  --help       Display this help message"
    echo "  --version    Display command version"
}

function show_version {
    echo "internsctl v0.1.0"
}

case $1 in
    --help)
        show_help
        ;;
    --version)
        show_version
        ;;
    *)
        echo "Error: Unknown option. Use 'internsctl --help' for usage information."
        exit 1
        ;;
esac

#Section B
#Part 1

#!/bin/bash

function show_help {
    echo "Usage: internsctl [COMMAND] [OPTIONS]"
    echo "Commands:"
    echo "  cpu getinfo      Display CPU information"
    echo "  memory getinfo   Display memory information"
    echo "  --help           Display this help message"
    echo "  --version        Display command version"
}

function show_version {
    echo "internsctl v0.1.0"
}

function get_cpu_info {
    lscpu
}

function get_memory_info {
    free
}

case $1 in
    cpu)
        case $2 in
            getinfo)
                get_cpu_info
                ;;
            *)
                echo "Error: Unknown subcommand for 'cpu'. Use 'internsctl cpu getinfo' for CPU information."
                exit 1
                ;;
        esac
        ;;
    memory)
        case $2 in
            getinfo)
                get_memory_info
                ;;
            *)
                echo "Error: Unknown subcommand for 'memory'. Use 'internsctl memory getinfo' for memory information."
                exit 1
                ;;
        esac
        ;;
    --help)
        show_help
        ;;
    --version)
        show_version
        ;;
    *)
        echo "Error: Unknown command. Use 'internsctl --help' for usage information."
        exit 1
        ;;
esac

#Part 2
#!/bin/bash

function show_help {
    echo "Usage: internsctl [COMMAND] [OPTIONS]"
    echo "Commands:"
    echo "  cpu getinfo            Display CPU information"
    echo "  memory getinfo         Display memory information"
    echo "  user create <username> Create a new user"
    echo "  user list              List all regular users"
    echo "  user list --sudo-only  List users with sudo permissions"
    echo "  --help                 Display this help message"
    echo "  --version              Display command version"
}

function show_version {
    echo "internsctl v0.1.0"
}

function get_cpu_info {
    lscpu
}

function get_memory_info {
    free
}

function create_user {
    if [ -z "$2" ]; then
        echo "Error: Missing username. Usage: 'internsctl user create <username>'"
        exit 1
    fi

    sudo useradd -m "$2"
    echo "User '$2' created successfully."
}

function list_users {
    cut -d: -f1 /etc/passwd
}

function list_sudo_users {
    grep -Po '^sudo.+:\K.*$' /etc/group | tr ',' '\n'
}

case $1 in
    cpu)
        case $2 in
            getinfo)
                get_cpu_info
                ;;
            *)
                echo "Error: Unknown subcommand for 'cpu'. Use 'internsctl cpu getinfo' for CPU information."
                exit 1
                ;;
        esac
        ;;
    memory)
        case $2 in
            getinfo)
                get_memory_info
                ;;
            *)
                echo "Error: Unknown subcommand for 'memory'. Use 'internsctl memory getinfo' for memory information."
                exit 1
                ;;
        esac
        ;;
    user)
        case $2 in
            create)
                create_user $@
                ;;
            list)
                if [ "$3" == "--sudo-only" ]; then
                    list_sudo_users
                else
                    list_users
                fi
                ;;
            *)
                echo "Error: Unknown subcommand for 'user'. Use 'internsctl user create <username>', 'internsctl user list', or 'internsctl user list --sudo-only'."
                exit 1
                ;;
        esac
        ;;
    --help)
        show_help
        ;;
    --version)
        show_version
        ;;
    *)
        echo "Error: Unknown command. Use 'internsctl --help' for usage information."
        exit 1
        ;;
esac

#Part 3
#!/bin/bash

function show_help {
    echo "Usage: internsctl [COMMAND] [OPTIONS]"
    echo "Commands:"
    echo "  cpu getinfo            Display CPU information"
    echo "  memory getinfo         Display memory information"
    echo "  user create <username> Create a new user"
    echo "  user list              List all regular users"
    echo "  user list --sudo-only  List users with sudo permissions"
    echo "  file getinfo <filename> Get information about a file"
    echo "    Options:"
    echo "      --size, -s          Print file size"
    echo "      --permissions, -p   Print file permissions"
    echo "      --owner, -o         Print file owner"
    echo "      --last-modified, -m Print last modified time"
    echo "  --help                 Display this help message"
    echo "  --version              Display command version"
}

function show_version {
    echo "internsctl v0.1.0"
}

function get_cpu_info {
    lscpu
}

function get_memory_info {
    free
}

function create_user {
    if [ -z "$2" ]; then
        echo "Error: Missing username. Usage: 'internsctl user create <username>'"
        exit 1
    fi

    sudo useradd -m "$2"
    echo "User '$2' created successfully."
}

function list_users {
    cut -d: -f1 /etc/passwd
}

function list_sudo_users {
    grep -Po '^sudo.+:\K.*$' /etc/group | tr ',' '\n'
}

function get_file_info {
    if [ -z "$2" ]; then
        echo "Error: Missing filename. Usage: 'internsctl file getinfo <filename>'"
        exit 1
    fi

    filename="$2"

    if [ -z "$3" ]; then
        # No specific option provided, show all info
        ls -l "$filename"
    else
        case $3 in
            --size | -s)
                stat --format="%s" "$filename"
                ;;
            --permissions | -p)
                stat --format="%A" "$filename"
                ;;
            --owner | -o)
                stat --format="%U" "$filename"
                ;;
            --last-modified | -m)
                stat --format="%y" "$filename"
                ;;
            *)
                echo "Error: Unknown option. Use 'internsctl file getinfo [options] <filename>' for file information."
                exit 1
                ;;
        esac
    fi
}

case $1 in
    cpu)
        case $2 in
            getinfo)
                get_cpu_info
                ;;
            *)
                echo "Error: Unknown subcommand for 'cpu'. Use 'internsctl cpu getinfo' for CPU information."
                exit 1
                ;;
        esac
        ;;
    memory)
        case $2 in
            getinfo)
                get_memory_info
                ;;
            *)
                echo "Error: Unknown subcommand for 'memory'. Use 'internsctl memory getinfo' for memory information."
                exit 1
                ;;
        esac
        ;;
    user)
        case $2 in
            create)
                create_user $@
                ;;
            list)
                if [ "$3" == "--sudo-only" ]; then
                    list_sudo_users
                else
                    list_users
                fi
                ;;
            *)
                echo "Error: Unknown subcommand for 'user'. Use 'internsctl user create <username>', 'internsctl user list', or 'internsctl user list --sudo-only'."
                exit 1
                ;;
        esac
        ;;
    file)
        case $2 in
            getinfo)
                get_file_info $@
                ;;
            *)
                echo "Error: Unknown subcommand for 'file'. Use 'internsctl file getinfo [options] <filename>' for file information."
                exit 1
                ;;
        esac
        ;;
    --help)
        show_help
        ;;
    --version)
        show_version
        ;;
    *)
        echo "Error: Unknown command. Use 'internsctl --help' for usage information."
        exit 1
        ;;
esac
