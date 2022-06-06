import std / [
  asyncdispatch,
  os, logging,
  random, options,
  strutils, strformat
]

import telebot

import quotes, auth, voices, youtube

# const token = strip(slurp("bot.token"))
const token = getEnv("ANYA_TELEGRAM_BOT_TOKEN")

proc update(b: TeleBot, u: Update): Future[bool] {.async.} =
  if u.message.isNone:
    return true
  # if u.message.get.isYoutube():
  # else:
  randomize()
  let roll = rand(8)
  if roll != 0: return false
  var res = u.message.get
  if res.text.isSome:
    # let text = res.text.get
    let firstName = res.fromUser.get.firstName
    discard await b.sendMessage(res.chat.id, quote(firstName), replyToMessageId=res.messageId)

proc pong(b: TeleBot, c: Command): Future[bool] {.gcsafe, async.} =
  if c.isPapa():
    discard b.sendMessage(c.message.chat.id, "pong")
    result = true
  else:
    discard b.sendMessage(c.message.chat.id, "アーニャおまえのことしらない")
    result = true

when isMainModule:
  let bot = newTeleBot(token)

  var commands = @[
    BotCommand(command: "ping", description: "PING"),
    BotCommand(command: "voice", description: "The Kawaii voice messages")
  ]

  echo waitFor bot.setMyCommands(commands)

  bot.onCommand("ping", pong)
  bot.onCommand("voice", voice)
  bot.onUpdate(update)
  bot.poll(timeout=300)