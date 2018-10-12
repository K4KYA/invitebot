randomInt = (lower, upper) ->
  [lower, upper] = [0, lower]     unless upper?          
  [lower, upper] = [upper, lower] if lower > upper       
  Math.floor(Math.random() * (upper - lower + 1) + lower)

console.log(randomInt(1))

input = "@here bunting testing with :partyparrot: 01"
words = input.split " "
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
console.log(phrase[..-15])

console.log(input.indexOf "here", 0)