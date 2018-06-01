## What is a shell script?
[Wiki](https://en.wikipedia.org/wiki/Shell_script).

## Best practices

* [Best Practices for Writing Bash Scripts (kvz.io).](https://kvz.io/blog/2013/11/21/bash-best-practices/)
* [Use the Unofficial Bash Strict Mode (Unless You Looove Debugging (redsymbol.net)](http://redsymbol.net/articles/unofficial-bash-strict-mode/)
* [kvz/bash3boilerplate](https://github.com/kvz/bash3boilerplate/blob/master/main.sh)

```shell
# Define error reporting level, file seperator, and init direcotry.
function init(){
    set -Eeuo pipefail; # set -o xtrace;
    IFS=$'\n\t'
    DIR=$PWD;
    ROOT_DIR="$(dirname "${DIR}")";
}
init
```

## Error params

* [4.3.1 The Set Builtin (gnu.org/software/bash)](https://www.gnu.org/software/bash/manual/html_node/The-Set-Builtin.html#The-Set-Builtin)

## Where to look for a serious working example?
* [epety/100-shell-script-examples](https://github.com/epety/100-shell-script-examples).
* [natelandau/shell-scripts](https://github.com/natelandau/shell-scripts).
* Netbeans 8.2 installer. It is a ~ 120 MB large shell script. You can download it
[here](https://netbeans.org/downloads/start.html?platform=linux&lang=en&option=php&bits=x64).
It contains `functions`, `ifs`, `loops` and so on.

## Great reads
* `man bash`.
* [Advanced Bash-Scripting Guide](http://tldp.org/LDP/abs/html/) from [The Linux Documentation Project](http://tldp.org/).
* [Say what? Kipibenkipod view of the world](http://www.kfirlavi.com/).
* [Naming_Conventions](https://google.github.io/styleguide/shell.xml#Naming_Conventions).
* [Defensive BASH Programming](http://www.kfirlavi.com/blog/2012/11/14/defensive-bash-programming/).

## Useful tools
* [nbshell plugin for Netbeans](http://plugins.netbeans.org/plugin/68049/nbshell).
* [isao/shell - various scripts and support files for noodling on the command line, esp bbedit, git, etc](https://github.com/isao/shell)
* [xbot/shell - This repo hosts miscellaneous scripts I use in my daily life.](https://github.com/xbot/shell)
* [smilejay/shell - some of Jay's shared Shell codes. http://smilejay.com](https://github.com/smilejay/shell)
* [hjxhjh/shell - some of my shared shell scripts](https://github.com/hjxhjh/shell)
* [Crabbit/shell - My shell scripts.](https://github.com/Crabbit/shell)
* [geekcomputers/Shell - Some of the handy shell scripts I have created/acquired](https://github.com/geekcomputers/Shell)
* [dl - fetch remote file for convenient local reading](https://github.com/redsymbol/dl)

## Good to know

* Remember to add backslash '\' for special symbols in texts. Example,
`echo "I `don't` want it."` will raise error `don't: command not found` and the
output will become `I want it.`. Noticed this when pushing a commit and some of
the text was missing because I used `` to highlight a code.
* Shell scripts are very strict about spaces so `if[[ ... ]]` won't work because
after `if` there should be a space.

### Debugging

* http://redsymbol.net/articles/unofficial-bash-strict-mode/
* https://www.shellcheck.net/

* `set -x` for debug. More in [learn-basics/debug.sh](learn-basics/debug.sh).
* use `exit` to stop the script. 
* Better write outpout to file with echo -e, otherwise the output in terminal can be misleading.


---------------------------------
Started in Jan 2018
