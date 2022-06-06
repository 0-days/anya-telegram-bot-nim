import std / [ asyncdispatch, options, os, random ]
import telebot

proc voice*(b: TeleBot, c: Command): Future[bool] {.async.} =
  proc choose(): string =
    const
      t01 = "108305-2-3.mp4"
      t02 = "108305-2-163.mp4"
      t03 = "108305-2-208.mp4"
      t04 = "108305-2-241.mp4"
      t05 = "108305-2-140.mp4"
      t06 = "108305-2-196.mp4"
      t07 = "108305-2-209.mp4"
      t08 = "108305-2-250.mp4"
      t09 = "108305-2-143.mp4"
      t10 = "108305-2-197.mp4"
      t11 = "108305-2-210.mp4"
    randomize()
    let roll = rand(10)
    return case roll
      of 0: t01
      of 1: t02
      of 2: t03
      of 3: t04
      of 4: t05
      of 5: t06
      of 6: t07
      of 7: t08
      of 8: t09
      of 9: t10
      of 10: t11
      else: return

  discard await b.sendVoice(c.message.chat.id, "file://" & getAppDir() / "voices" / choose())