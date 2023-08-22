#!/bin/bash
if ! command -v cargo &> /dev/null
then
    echo "cargo could not be found, installing rust now..."
    curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh
    exit
fi
if [[ "$OSTYPE" == "linux-gnu"* ]]; then
        echo "linux"# ...
elif [[ "$OSTYPE" == "darwin"* ]]; then
	echo "osx"        # Mac OSX
	if ! command -v brew &> /dev/null
	then
	    echo "brew could not be found, installing rust now..."
	    /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
	    exit
	fi
	brew install protobuf
elif [[ "$OSTYPE" == "cygwin" ]]; then
echo "cygwin"        # POSIX compatibility layer and Linux environment emulation for Windows
elif [[ "$OSTYPE" == "msys" ]]; then
echo "msys"        # Lightweight shell and GNU utilities compiled for Windows (part of MinGW)
elif [[ "$OSTYPE" == "freebsd"* ]]; then
echo "bsd"        # ...
else
echo "wtf"        # Unknown.
fi
git pull
git submodule update --init --recursive

echo "done"
