#!/usr/bin/env bats

setup() {
    SOURCE_DIR="$( cd "$( dirname "$BATS_TEST_FILENAME" )" >/dev/null 2>&1 && pwd )"
}

@test "test return value" {
    true
    # false
}

@test "test run script" {
    "$SOURCE_DIR/basics.sh"
}

@test "test check functions" {
    . "$SOURCE_DIR/functions.sh"
    [ "$(to_upper "hase")" = "HASE" ]
}
