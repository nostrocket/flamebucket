#!/bin/bash
if ! command -v cargo &> /dev/null
then
    echo "cargo could not be found, installing rust now..."
    curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh
    exit
fi
rustup update
if [[ "$OSTYPE" == "linux-gnu"* ]]; then
        echo "linux"# ...
elif [[ "$OSTYPE" == "darwin"* ]]; then
	echo "OSX detected, this must be a local development machine"
	if ! command -v brew &> /dev/null
	then
	    echo "brew could not be found, installing now..."
	    /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
	    exit
	fi
	brew install protobuf
	brew install tmux
#	brew install haproxy
#	brew services start haproxy
#	brew install certbot
elif [[ "$OSTYPE" == "cygwin" ]]; then
echo "cygwin"        # POSIX compatibility layer and Linux environment emulation for Windows
elif [[ "$OSTYPE" == "msys" ]]; then
echo "msys"        # Lightweight shell and GNU utilities compiled for Windows (part of MinGW)
elif [[ "$OSTYPE" == "freebsd"* ]]; then
echo "bsd"        # ...
else
echo "wtf"        # Unknown.
fi
git submodule update --init --recursive
git pull
cd flamebucketmanager || exit 1
cargo build -r
if ! test -f "./target/release/manage_relay_users"; then
  echo "failed to compile"
  exit 1
fi
echo "relay manager has compiled successfully"
cd ../nostr-rs-relay || exit 1
cargo build -r
if ! test -f "./target/release/nostr-rs-relay"; then
  echo "failed to compile"
  exit 1
fi
echo "relay has compiled successfully"
rm config.toml
cp ../config.toml .
echo "done"
echo "now run ./start.sh"