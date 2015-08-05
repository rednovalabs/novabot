# Put in scripts/
# Be sure to have "redis-brain.coffee" in your hubot-scripts.json
# @hubot, Colin is a dev
# Hubot: Ok, Colin is a dev
# @hubot, who is Colin
# Hubot: Colin is a dev.
# @dev, testing?
# (in same flow) Hubot: @Colin :arrow_up:

# From https://gist.github.com/perplexes/8e39456eae20ed458883

_   = require("underscore")

`function escapeRegExp(str) {
  return str.replace(/[\-\[\]\/\{\}\(\)\*\+\?\.\\\^\$\|]/g, "\\$&");
}`

module.exports = (robot) ->

  robot.brain.data.roles ||= {}

  _.each robot.brain.data.users, (k, v) ->
    if v && v.roles && v.name
      _.each roles, (role) ->
        robot.brain.data.roles[role] ||= {}
        robot.brain.data.roles[role][v.name] ||= true

  robot.hear /(.*)/, (msg) ->
    text = msg.match[1]
    console.log("text", text)
    text = text.replace(/verbot: /i, "")
    console.log("text2", text)

    group_m = text.match(/@(\w+)/)
    console.log("group_m", group_m)

    unless group_m
      return

    group = group_m[1]

    console.log(group: group)
    unless group
      return

    unless robot.brain.data.roles?
      return

    console.log("msg", text)
    console.log("group", group)
    console.log("roles", robot.brain.data.roles)

    group_regex = new RegExp(escapeRegExp(group), "i")

    users = _.find robot.brain.data.roles, (v, k, o) ->
      k.match(group_regex)

    if _.isEmpty(users)
      console.log("empty")
      return

    ats = _.map _.keys(users), (user) ->
      "@#{user}"
    msg.send(ats.join(" ") + " :arrow_up:")

  robot.respond /list groups/, (msg) ->
    msg.send _.keys(robot.brain.data.roles).join(", ")

  robot.respond /list members of (.*)/, (msg) ->
    msg.send _.keys(robot.brain.data.roles[msg.match[1]])
