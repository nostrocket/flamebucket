#!/bin/bash
cd nostr-rs-relay || exit
cp local_only.toml .
RUST_LOG=debug,nostr_rs_relay=info ./target/release/nostr-rs-relay --config local_only.toml