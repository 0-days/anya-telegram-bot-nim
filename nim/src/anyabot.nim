import std / [
  asyncdispatch, logging,
  random, options,
  strutils, strformat
]

import telebot

import quotes

const token = strip(slurp("bot.token"))

proc update(b: TeleBot, u: Update): Future[bool] {.async.} =
  randomize()
  let roll = rand(8)
  if roll != 0: return false
  if not u.message.isSome:
    return true
  var res = u.message.get
  if res.text.isSome:
    # let text = res.text.get
    let firstName = res.fromUser.get.firstName
    discard await b.sendMessage(res.chat.id, quote(firstName), replyToMessageId=res.messageId)

proc pong(b: TeleBot, c: Command): Future[bool] {.gcsafe, async.} =
  discard b.sendMessage(c.message.chat.id, "pong")
  result = true

when isMainModule:
  let bot = newTeleBot(token)

  var commands = @[
    BotCommand(command: "ping", description: "PING")
  ]

  echo waitFor bot.setMyCommands(commands)

  bot.onCommand("ping", pong)
  bot.onUpdate(update)
  bot.poll(timeout=300)