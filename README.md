## Description
App to lookup if IP or hostname is on Amazon's EC2 infrastructure.

## Setup and Usage

```sh
$ bundle install
# start server
$ bundle exec shotgun

# In another tab
$ curl http://localhost:9393/google.com
NOPE
$ curl http://localhost:9393/heroku.com
YEP
```

## Credits
* @hundredwatt for [the gist](https://gist.github.com/2464999) that kicked this off
