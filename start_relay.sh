#!/bin/bash
cd nostr-rs-relay || exit
RUST_LOG=debug,nostr_rs_relay=info ./target/release/nostr-rs-relay --config config.toml