#!/usr/bin/env nu

# Inspired by this Reddit post:
# https://www.reddit.com/r/fishshell/comments/152zkrz/prj_a_simple_fish_function_for_jumping_to_projects/

def main [] {
  # Check that fd and either sk or fzf binaries are in $PATH.
  if (which ^fd | is-empty) {
    print 'fd is required but was not found in $PATH'
    exit 1
  }

  let fzf_bin = if not (which ^sk | is-empty) {
    'sk'
  } else if not (which ^fzf | is-empty) {
    'fzf'
  } else {
    print 'One of sk or fzf is required but neither was found in $PATH'
    exit 1
  }

  let projects_dir = if PROJECTS_DIR in $env {
    $env.PROJECTS_DIR
  } else {
    "~/dev"
  } | path expand

  let git_dirs = ^fd -t d -H --no-ignore-vcs '^.git$' $projects_dir
    | lines
    | each {|e| $e | path relative-to $projects_dir | path dirname }
    | sort

  let output = $git_dirs | to text | ^$fzf_bin | complete
  if $output.exit_code > 0 {
    exit 1
  }

  let dir = $output.stdout | str trim -r
  print -n ($projects_dir | path join $dir)
}
