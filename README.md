zig
===

Store zip-based files in git.

Usage
-----

This example is about a repository of [sketch](https://www.sketchapp.com/)
files. Those files are binary type, actually they do contain json-files packed
as zip. Git is not deigned to handle binary files, so wouldn't it be great if
you could just check them in as multiple json files?

This project is about a possible simple solution that could be used. It works
like this.

 - `zig init` initializes a git repository by asking for a filename extension
   and adding it to the git configuration.
 - `zig zip` will search for all directories matching a to zip filename pattern
   and build the representive file.
 - `git unzip` will search for all files with the configured extension and
   extract it to the correspondent directory.
 - `git uninstall` will remove all configuration from your git config.

Installation
------------

zig is yet only an idea described within the [Usage](#usage)-section.  
Depending on the solution made, the installation will look like.  
`zig` will probably be a simple bash script, so you could just download it and
execute it directly.

Limitations
-----------

 - Currently files to handle are defined by filename extension. Other solutions
   are possible, but will follow.
 - Currently all files are extracted or compressed. A check on the timestamp
   will follow.

Links
-----

 - [Sources](https://github.com/rynr/zig)
 - [Info](https://rynr.github.com/zig)
