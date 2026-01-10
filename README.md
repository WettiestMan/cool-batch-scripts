# cool-batch-scripts
A set of convenient CMD scripts, along with an AutoRun file

---

This is my tiny collection of CMD files I use for convenience.  

It includes a script to be used as an AutoRun file: ```_dosrc.cmd```
(My plan was to upload it as ```.dosrc.cmd``` since that's the original
name of my AutoRun file, but usually dotfiles are hidden in *nix systems,
so it seems it couldn't be :( ), as well as a folder called ```dosfx```
with scripts referenced by the AutoRun file to be run anywhere on CMD.

# What's an AutoRun file?

If you have ever seen *nix people sharing and customizing a series of
straneous files like ```.bashrc```, ```.zshrc``` (for people that use zsh
as their shell), or even PowerShell people with ```$PROFILE```, well, an
AutoRun file is kinda the same for CMD. It's a batch script file that's
run every time you open a new CMD shell (unless you open CMD with the
```/d``` flag, which specifically disables that.)

Inside those script files, you can put a lotta useful stuff like
aliases, or run some commands at startup (like modifying your path
for CMD interactive sessions only, or even run fastfetch like some *nix
people tend to do (of course, you need fastfetch installed first, so
here you go: ```winget install fastfetch```).)

Unlike other shells, CMD AutoRun files can have any name you want
(I chose ```.dosrc.cmd``` as a homage to MS-DOS and .*rc files for
*sh-based shells), but they have to be referenced by specifying their paths
in any of the following Registry entries (if they don't exist, you can
create any of them, or both):

```HKEY_CURRENT_USER\Software\Microsoft\Command Processor\AutoRun (For the user that's currently logged on the machine)```
```HKEY_LOCAL_MACHINE\Software\Microsoft\Command Processor\AutoRun (For all users on the machine)```

Of course, I have to remind you to be cautious with the Windows Registry,
since any change in other entries could potentially have unwanted results
on random applications or even Windows itself. I can't stop you from
touching the Registry because it's your computer, and you are in your right
to customize your machine in the way you want, but always remember to
**DO YOUR RESEARCH**, don't change random stuff in your Registry if you don't
know what you're doing. Being informed and reading the docs is what helps you
building your dream machine while avoiding making it unusable.

You can read more about AutoRun files here -> [https://ss64.com/nt/syntax-autoexec.html](https://ss64.com/nt/syntax-autoexec.html)

**Happy tinkering 😊!**
