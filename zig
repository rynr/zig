#!/bin/bash

zig_usage() {
  echo "usage:"
  echo ""
  echo "  zig <command>"
  echo ""
  echo "command is one of the following:"
  echo "  init       Initialize a git repository"
  echo "  zip        zip all extracted sources (if updated)"
  echo "  unzip      unzip all sources (if updated)"
  echo "  uninstall  remove all configuration of zig"
}

zig_set_ext() {
  zig_ext=`git config --local zig.ext`
  zig_ext=${zig_ext//[^a-zA-Z0-9]/}
}

zig_init() {
  echo "Please enter the extension that you want zig to handle."
  echo "(only characters and numbers allowed, for example sketch, xslx, …)"
  echo -n "extension: "
  read zig_ext
  # cleanup
  zig_ext=${zig_ext//[^a-zA-Z0-9]/}

  if [ -n "$zig_ext" ]; then
    git config --local --replace-all zig.ext "$zig_ext"
    if [ $? -eq 0 ]; then
      echo "Configured zig extension $zig_ext to local git configuration"
    else
      echo "Could not configured zig extension, is this a git repository?"
      exit 1
    fi
  else
    echo "abort - no extension given"
    exit 1
  fi
}

zig_zip() {
  zig_set_ext
  if [ -z "$zig_ext" ]; then
    echo "No configuration for zig present .. exiting"
    exit 1
  else
    find `git rev-parse --show-toplevel` \
      -type d -name \*.$zig_ext.extract \
      -exec sh -c 'zip $(dirname {})/$(basename {} .extract) {}' \;
  fi
}

zig_unzip() {
  zig_set_ext
  if [ -z "$zig_ext" ]; then
    echo "No configuration for zig present .. exiting"
    exit 1
  else
    find `git rev-parse --show-toplevel` \
      -type d -name \*.$zig_ext \
      -exec sh -c 'unzip {} $(dirname {})/$(basename {} .extract)' \;
  fi
}

zig_uninstall() {
  zig_set_ext
  if [ -z "$zig_ext" ]; then
    echo "No configuration for zig present .. exiting"
    exit 1
  else
    git config --local --unset-all zig
    if [ $? -eq 0 ]; then
      echo "Removed zig extension $zig_ext from local git configuration"
    else
      echo "Could not remove zig extension, is this a git repository?"
      exit 1
    fi
  fi
}

case $1 in
  init)
    zig_init
    ;;
  zip)
    zig_zip
    ;;
  unzip)
    zig_unzip
    ;;
  uninstall)
    zig_uninstall
    ;;
  *)
    zig_usage
    ;;
esac
