# Description:
#   Domain availability via DNSimple.
#
# Dependencies:
#   None
#
# Configuration:
#   HUBOT_DNSIMPLE_USERNAME
#   HUBOT_DNSIMPLE_API_TOKEN
#
# Commands:
#   hubot check domain <domainname> - returns whether a domain is available
#
# Author:
#   jonmagic

dnsimpleToken = new Buffer(process.env.HUBOT_DNSIMPLE_USERNAME + ':' + process.env.HUBOT_DNSIMPLE_API_TOKEN).toString('base64');

module.exports = (robot) ->
  robot.respond /check domain (.+)$/i, (msg) ->
    domain = escape(msg.match[1])
    msg.http("https://api.dnsimple.com/v1/domains/#{domain}/check")
      .headers("X-DNSimple-Token": dnsimpleToken, Accept: 'application/json')
      .get() (err, res, body) ->
        switch res.statusCode
          when 200
            msg.send "Sorry, #{domain} is not available."
          when 404
            msg.send "Cybersquat that shit!"
          when 401
            msg.send "You need to authenticate by setting the DNSIMPLE_USERNAME & DNSIMPLE_API_TOKEN environment variables"
          else
            msg.send "Unable to process your request and we're not sure why :("
