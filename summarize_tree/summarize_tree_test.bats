#!/usr/bin/env bats

# Create a temporary scratch directory to work with
setup() {
    BATS_TMPDIR=`mktemp --directory`
}

# Remove the scratch directory
teardown() {
    rm -rf "$BATS_TMPDIR"
}

@test "summarize_tree exists" {
    [ -f "summarize_tree" ]
}

@test "summarize_tree is executable" {
    [ -x "summarize_tree" ]
}

@test "summarize_tree runs successfully" {
    run ./summarize_tree test_data/fewer_files > "$BATS_TMPDIR"/outputFile
    [ "$status" -eq 0 ]
}

@test "summarize_tree works with small directory structure" {
    ./summarize_tree test_data/fewer_files > "$BATS_TMPDIR"/outputFile
    run diff -wbB test_data/small_dir_sizes "$BATS_TMPDIR"/outputFile
    [ "$status" -eq 0 ]
}

@test "summarize_tree works with large directory structure" {
    ./summarize_tree test_data/loads_o_files > "$BATS_TMPDIR"/outputFile
    run diff -wbB test_data/large_dir_sizes "$BATS_TMPDIR"/outputFile
    [ "$status" -eq 0 ]
}

@test "summarize_tree_ftw exists" {
    [ -f "summarize_tree_ftw" ]
}

@test "summarize_tree_ftw is executable" {
    [ -x "summarize_tree_ftw" ]
}

@test "summarize_tree_ftw runs successfully" {
    run ./summarize_tree_ftw test_data/fewer_files > "$BATS_TMPDIR"/outputFile
    [ "$status" -eq 0 ]
}

@test "summarize_tree_ftw works with small directory structure" {
    ./summarize_tree_ftw test_data/fewer_files > "$BATS_TMPDIR"/outputFile
    run diff -wbB test_data/small_dir_sizes "$BATS_TMPDIR"/outputFile
    [ "$status" -eq 0 ]
}

@test "summarize_tree_ftw works with large directory structure" {
    ./summarize_tree_ftw test_data/loads_o_files > "$BATS_TMPDIR"/outputFile
    run diff -wbB test_data/large_dir_sizes "$BATS_TMPDIR"/outputFile
    [ "$status" -eq 0 ]
}

@test "summarize_tree.sh exists" {
    [ -f "summarize_tree.sh" ]
}

@test "summarize_tree.sh is executable" {
    [ -x "summarize_tree.sh" ]
}

@test "summarize_tree.sh runs successfully" {
    run ./summarize_tree.sh test_data/fewer_files > "$BATS_TMPDIR"/outputFile
    [ "$status" -eq 0 ]
}

@test "summarize_tree.sh works with small directory structure" {
    ./summarize_tree.sh test_data/fewer_files > "$BATS_TMPDIR"/outputFile
    run diff -wbB test_data/small_dir_sizes "$BATS_TMPDIR"/outputFile
    [ "$status" -eq 0 ]
}

@test "summarize_tree.sh works with large directory structure" {
    ./summarize_tree.sh test_data/loads_o_files > "$BATS_TMPDIR"/outputFile
    run diff -wbB test_data/large_dir_sizes "$BATS_TMPDIR"/outputFile
    [ "$status" -eq 0 ]
}
