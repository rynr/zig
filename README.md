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

 - `zig` initializes to a git repository
   - A configuration is added to the repositories configuration. A file
     extension is stored, on which files are meant to be treated as zip-based
     files.
   - The files matching to the given file-extension are added to the
     `.gitignore`-file.
   - Multiple githooks are added to handle conversion between pushing, staging
     and pulling of the content.
   - All directories matching with the defined file-extension and an additional
     `.extract` extension are ziped to a file with the same name (without the
     `.extract` extension.
 - `git add`, I don't yet know how I can handle this as github internally
   treats those files as ignored (as they are put into the `.gitignore` file.  
   I need to think about this, if you have any ideas on how to treat this, I'd
   be happy for comments on this.
 - `git pull` request will first extract all matching files to their extracted
   folder, then will pull the repository as it would usually happen, then it
   will overwrite the matching files (if there are changes) from the contents
   of the extract directories.

Installation
------------

zig is yet only an idea described within the [Usage](#Usage)-section.  
Depending on the solution made, the installation will look like.  
`zig` will probably be a simple bash script, so you could just download it and
execute it directly.

Links
-----

 - [Sources](https://github.com/rynr/zig)
 - [Info](https://rynr.github.com/zig)
