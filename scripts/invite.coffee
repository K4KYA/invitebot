# Description
#   Listens for messages which are mentions only, meant to invite people to the channel
#   Encourages use of /invite to do the same thing
#
# Author:
#   Amal Kakaiya[amal.kakaiya@gmail.com]

module.exports = (robot) ->
  robot.hear /^(@[\w\.\-\_]+ ?)+$/g, (res) ->
      res.reply "Tip: You can invite users faster by typing `/invite "+res.match+"` - no need to confirm, (and it doesn't alert others :roowithit:)"

  robot.hear /^bunting ([a-z0-9 ])+$/g, (res) ->
      words = res.match[0].split " "
      phrase = ""
      for word in words[1..]
        if word.toLowerCase().match(/[a-z]+/g)
          for l in word
            phrase += ":bunting_"+l+":"
        if word.match(/[0-9]+/g)
          for n in word
            phrase += ":"+n+":"
        phrase += "   "
      res.send phrase
