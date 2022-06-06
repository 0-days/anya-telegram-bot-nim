import std / [
  asyncdispatch, httpclient,
  os, options
]
import telebot

func isYoutube*(m: Message): bool =
  if m.text.isNone: return false