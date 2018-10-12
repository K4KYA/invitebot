# Description
#   Listens for messages which are mentions only, meant to invite people to the channel
#   Encourages use of /invite to do the same thing
#
# Author:
#   Amal Kakaiya[amal.kakaiya@gmail.com]

randomInt = (lower, upper) ->
  [lower, upper] = [0, lower]     unless upper?          
  [lower, upper] = [upper, lower] if lower > upper       
  Math.floor(Math.random() * (upper - lower + 1) + lower)

module.exports = (robot) ->
  robot.hear /^(@[\w\.\-\_]+ ?)+$/g, (res) ->
      res.reply "Tip: You can invite users faster by typing `/invite "+res.match+"` - no need to confirm, (and it doesn't alert others :roowithit:)"

  robot.hear /^bunting .+$/g, (res) ->
      words = res.match[0].split " "
      phrase = ""
      for word in words[1..]
        emoji = word.match(/(\:.+\:)/)
        text = word.toLowerCase().match(/[a-z]+/g)
        number = word.match(/[0-9]+/g)
        if emoji
          phrase += emoji[0]
        else if text
          for l in text[0]
            phrase += ":bunting_"+l+":"
        else if number
          for n in number[0]
            phrase += ":"+n+":"
        if randomInt(1) == 1
            phrase += ":bunting_teal:"
        else 
            phrase += ":bunting_kelp:"
      res.send phrase[..-15]
