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
    console.log(res.match)
    # Do not trigger for messages which are just @here or @channel
    containsHere = res.match[0].indexOf "here", 0
    containsChannel = res.match[0].indexOf "channel", 0
    if (containsHere != -1) || (containsChannel != -1)
      console.log("Message contains @here or @channel, ignoring")
      return

    # only trigger for messages which actually contain user mentions
    user_mentions = (mention for mention in res.message.mentions when mention.type is "user")
    if user_mentions.length > 0
      console.log("Message contains "+user_mentions.length+" mentions")
      if user_mentions.length == 1
        mentioned_username = user_mentions[0].info.name
        message = "You can invite users faster by typing `/invite @"+mentioned_username+"` - no need to confirm, and it doesn't alert others :roowithit:"
        res.reply message
      else if user_mentions.length > 1
        mentioned_username = user_mentions[0].info.name
        message = "You can invite users using `/invite` e.g. `/invite @"+mentioned_username+"` (one at a time) - no need to confirm, and it doesn't alert others :roowithit:"
        res.reply message

    else
      console.log("Message contains no mentions, ignoring")

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
