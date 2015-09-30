[![Build Status](https://snap-ci.com/thoughtworks/tw-in-out/branch/master/build_image)](https://snap-ci.com/thoughtworks/tw-in-out/branch/master)

# Pre-requisites

* Ruby ~> 2.1.0 (see `.ruby-version`)
* Bundler: `gem install bundler`

# Installing

```ruby
$ bundle install
$ bundle exec rake project:setup
```

# Running the tests

```ruby
$ bundle exec rake spec
```

# Running

```ruby
$ bundle exec rake project:start
```

### Environment
In order to run either the application or tests locally you must create a .env
file as following:

```
TW_IN_OUT_DB_HOST=localhost
```

### Docker Toolbox
If you want to use [Docker](https://docs.docker.com/), install version 1.3 or greater:

* [Getting started guide](https://www.docker.com/toolbox)

If you are cool and use brew cask:

```
$ brew cask install dockertoolbox
```

Start docker with all required images

```
$ bundle exec rake docker:start
```
