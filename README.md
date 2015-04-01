## debug-yeoman-generator.
> Simple bash util to help you debug a yeoman generator.


__Installation:__

Copy paste the below code in your terminal. (Expecting a *nix evn.)

```sh
$ curl -s https://raw.githubusercontent.com/hemanth/debug-yeoman-generator/mast
er/debug-generator.sh > /usr/bin/debug-generator; chmod a+x /usr/bin/debug-generator
```
__Usage:__

```sh
$ debug-generator <generator_name>
```

__Example:__

```sh
$ debug-generator node
```

^ Will help you to debug `generator-node` with `node-inspector`

__TODO:__

* Support other O.S

* Cleaner way to open browser.

* Cleanup (kill inspector et.al)
