#!/bin/bash
cd flamebucketmanager || exit
./target/release/manage_relay_users --config config.toml
