[![Build Status](https://snap-ci.com/thoughtworks/tw-in-out/branch/master/build_image)](https://snap-ci.com/thoughtworks/tw-in-out/branch/master)

# Pre-requisites

* Ruby ~> 2.0.0
* Bundler: `gem install bundler`
* PostgreSQL: `brew install postgresql`
* Heroku Toolbelt: `https://toolbelt.heroku.com/`
	- Or, at least, foreman: `https://github.com/ddollar/foreman`

# Installing

```bash
make
```

# Testing

```bash
rake spec
```

# Continuous testing

```bash
guard
```

# Running

```bash
make run
```
