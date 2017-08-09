# Description
#   Listens for messages which are mentions only, meant to invite people to the channel
#   Encourages use of /invite to do the same thing
#
# Author:
#   Amal Kakaiya[amal.kakaiya@gmail.com]

module.exports = (robot) ->
  robot.hear /^(@[\w\.\-\_]+ ?)+$/g, (res) ->
      res.reply "Tip: You can invite users faster by typing `/invite "+res.match+"` - no need to confirm"
