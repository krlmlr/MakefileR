## makeR

Makefile and tools for R packages

This is a git submodule we include in our R packages to have a Makefile and some tools for package building, testing and documentation generation. Including this as a submodule in other projects enables us to hold the code for this in one central place (i.e., here) without copy-paste horror. 

The submodule is always included under the path 'makeR' in the respective package repositories, e.g., look here:
https://github.com/berndbischl/BBmisc

### Installing the submodule

Execute **one** of the following in a terminal:

```
curl http://krlmlr.github.io/makeR/install2 | sh
```

Take a look at [the installer script](https://github.com/krlmlr/makeR/blob/gh-pages/install2) if you're curious.


### Initially cloning the submodule

If the 'makeR' directory is empty after you have cloned a package repository, simply do 

```
git submodule init
git submodule update
```

while in bash in the main, top-level directory of the respective package repo.

### Updating makeR

If you want to update the makeR tool chain, run: 

```
make upgrade
```

### More info

http://chrisjean.com/2009/04/20/git-submodules-adding-using-removing-and-updating/










