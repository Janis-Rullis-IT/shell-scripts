## What is a shell script?
[Wiki](https://en.wikipedia.org/wiki/Shell_script).

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
