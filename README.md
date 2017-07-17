zig
===

Store, merge, diff and easily handle zip-based binary files in git.

Usage
-----

Git is not good to store binary files. Many binary files are zipped files with
ascii content (like json or xml). This ascii content fitls well to git. So
wouldn't it be great if you could with the binary files and checkin the ascii
ones?

This project tries to find a feasible and simple solution that could be used,
it currently works like this.

 - `zig init` initializes a git repository by asking for a filename extension
   and adding it to the git configuration.
 - `zig zip` will search for all directories matching a to zip filename pattern
   and build the representive file.
 - `git unzip` will search for all files with the configured extension and
   extract it to the correspondent directory.
 - `git uninstall` will remove all configuration from your git config.

Installation
------------

Put the [zig](https://github.com/rynr/zig/raw/master/zig)-binary somewhere
where you can execute it.

    curl https://github.com/rynr/zig/raw/master/zig > zig && chmod u+x zig

Limitations
-----------

 - Currently files to handle are defined by filename extension. Other solutions
   are possible, but will follow.
 - Currently all files are extracted or compressed. A check on the timestamp
   will follow.
 - The current implementation uses bash functions, so it's bound to a unix-like
   system. You can use [cygwin](https://www.cygwin.com/) on windows.

Links
-----

 - [Sources](https://github.com/rynr/zig)
 - [Info](https://rynr.github.com/zig)
