import std / options
import telebot 

func isPapa*(c: Command): bool =
  if c.message.fromUser.isSome:
    let username = c.message.fromUser.get.username
    if username.isSome:
      if username.get == "nillability":
        return true