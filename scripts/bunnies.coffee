# Description:
#   Lagomorphs and friends!
#
# Dependencies:
#   None
#
# Configuration:
#   None
# 
# Commands:
#   hubot bunny me - A randomly selected bunny
#   hubot bunny me <w>x<h> - A bunny of the given size
#   hubot bunny bomb me <number> - Many many bunny!
#   hubot bunny demon me - A nightbare bunny...
#   hubot bunny somber me - A somber bunny *sigh*
#
# Author:
#   Smalls

ROOT = "http://placerabbit.com"
BASE_HEIGHT = Math.floor(Math.random()*250) + 250
BASE_WIDTH = Math.floor(Math.random()*250) + 250

module.exports = (robot) ->
  robot.respond /bunny?(?: me)?$/i, (msg) ->
    msg.send bunnyMe()

  robot.respond /bunny?(?: me)? (\d+)(?:[x ](\d+))?$/i, (msg) ->
    msg.send bunnyMe msg.match[1], (msg.match[2] || msg.match[1])

  robot.respond /bunny bomb(?: me)?( \d+)?$/i, (msg) ->
    bunnies = msg.match[1] || 5
    msg.send(bunnyMe()) for i in [1..bunnies]

  robot.respond /bunny demon(?: me)?$/i, (msg) ->
    msg.send colorBunnyMe("i")

  robot.respond /bunny somber(?: me)?$/i, (msg) ->
    msg.send colorBunnyMe("g")

bunnyMe = (height, width)->
  h = height || BASE_HEIGHT
  w = width || BASE_WIDTH
  return "#{ROOT}/#{h}/#{w}#.png"

colorBunnyMe = (color)->
  return "#{ROOT}/#{color}/#{BASE_HEIGHT}/#{BASE_WIDTH}#.png"
