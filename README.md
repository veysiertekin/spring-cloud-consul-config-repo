# `consul` key/value Repository

To use this repository you need two things:

* An installed [`consul`](https://www.consul.io)  instance.
 * `brew cask install consul`
* [`git2consul`](https://github.com/Cimpress-MCP/git2consul) key/value migration tool.
 * `npm install -g git2consul`

--

Check configurations:

```bash
$ vi git-and-consul.config
```

Be sure to `git2consul.sh` is executable.

```bash
$ chmod +x ./git2consul.sh
```

Let's push application properties to `consul`!

```bash
$ ./git2consul.sh
```
