# Linuxtag
Sources for Bash Scripting Workshop

## Basics
* shebang
* comments
* echo & printf
    * escaping
    * colors
* functions
    * arguments
* controls
    * for
    * while
    * if
    * case
* variables
    * global
    * export
    * local
    * default
* arguments
    * first $1
    * all $*
    * all $@

## Files
* touch/rm
* read/write

## Advanced
* pipes
    * PIPESTATUS
    * piped input
* subshells
* sourcing
* arrays
* maps
* output (`2>&1`)
* trap
* [special variables](https://www.gnu.org/software/bash/manual/html_node/Bash-Variables.html)
    * RANDOM
    * BASH_SOURCE

## More Advanced
* getopts
* logging
* networking
    * nc
    * curl
* cryptography
    * openssl
* zenity
* auto completion

## Unit Testing
* bats: https://bats-core.readthedocs.io/en/stable/

## Code checking
* shellcheck

## Code formatting
* `shfmt -ci -sr -i 4 -w script.sh`

## More
* https://www.gnu.org/software/bash/manual/bash.html
