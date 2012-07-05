cd "$(dirname "$0")"

function install() {
    rsync \
        --exclude ".git/" \
        --exclude ".gitignore" \
        --exclude "install.sh" \
        --exclude "README.md" \
        -av . ~
}

read -p "Running this file, you'll override some config files. Do you want to continue? (y/n) "

if [[ $REPLY =~ ^[yY] ]]; then
	install	
fi