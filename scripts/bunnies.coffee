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

module.exports = (robot) ->
  robot.respond /(bunny|rabbit)?(?: me)?$/i, (msg) ->
    msg.send bunnyMe()

  robot.respond /(bunny|rabbit)?(?: me)? (\d+)(?:[x ](\d+))?$/i, (msg) ->
    msg.send bunnyMe msg.match[2], (msg.match[3] || msg.match[2])

  robot.respond /(bunny|rabbit)? bomb(?: me)?( \d+)?$/i, (msg) ->
    bunnies = msg.match[2] || 5
    msg.send(bunnyMe()) for i in [1..bunnies]

  robot.respond /(bunny|rabbit)? demon(?: me)?$/i, (msg) ->
    msg.send colorBunnyMe("i")

  robot.respond /(bunny|rabbit)? somber(?: me)?$/i, (msg) ->
    msg.send colorBunnyMe("g")

bunnyMe = (height, width)->
  h = height || Math.floor(Math.random()*250) + 250
  w = width || Math.floor(Math.random()*250) + 250
  return "#{ROOT}/#{h}/#{w}#.png"

colorBunnyMe = (color)->
  h = Math.floor(Math.random()*250) + 250
  w = Math.floor(Math.random()*250) + 250
  return "#{ROOT}/#{color}/#{h}/#{w}#.png"
