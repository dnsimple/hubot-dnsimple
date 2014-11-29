# Hubot: hubot-dnsimple

A hubot script that checks domain availability via [DNSimple](https://dnsimple.com/).

[![Build Status](https://travis-ci.org/aetrion/hubot-dnsimple.svg?branch=master)](https://travis-ci.org/aetrion/hubot-dnsimple)
[![npm version](https://badge.fury.io/js/hubot-dnsimple.svg)](http://badge.fury.io/js/hubot-dnsimple)


## Installation

Add **hubot-dnsimple** to your `package.json` file:

```json
"dependencies": {
  ...,
  "hubot-dnsimple": "latest"
}
```

Add **hubot-dnsimple** to your `external-scripts.json`:

```json
["hubot-dnsimple"]
```

Run `npm install hubot-dnsimple`


## Configuration

- `HUBOT_DNSIMPLE_USERNAME` your DNSimple account email
- `HUBOT_DNSIMPLE_API_KEY` your DNSimple account api token (see [developer.dnsimple.com](http://developer.dnsimple.com/))


## Commands

    hubot check domain <domainname>       # returns whether a domain is available
