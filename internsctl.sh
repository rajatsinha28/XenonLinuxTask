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
