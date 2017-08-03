# Description
#   Listens for mentions of 'guys' and responds with helpful alternatives
#
# Author:
#   Amal Kakaiya[amal.kakaiya@gmail.com]

SUGGESTIONS = [
  'Why not try to',
  'Next time try to',
  'Did you know you could',
  'Perhaps you meant to',
  'Did you mean to'
]

TRY_INVITE_1 = " use \`/invite\` to invite `"

TRY_INVITE_2 = "` to this channel? It avoids an unnecessary unread notification for everyone in the channel, and means you don\'t have to confirm that you actually wanted to invite them. Win, win! Try it next time!"

getRandomItem = (items) ->
  i = Math.floor(Math.random() * items.length)
  items[i]

module.exports = (robot) ->
  robot.hear /^(@[\w\.\-\_]+ ?)+$/g, (res) ->
      res.send getRandomItem(SUGGESTIONS) + TRY_INVITE_1 + res.match + TRY_INVITE_2
