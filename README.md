# .environment

## Working with Git Submodules

To clone including submodules:

```
$ git clone --recursive https://github.com/chrisdaish/.environment.git
```

Already have the repo?

```
$ git submodule update --init --recursive
```

To update submodules for commiting back to this repository.

```
$ git submodule update --remote --merge
```
