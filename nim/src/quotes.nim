import std / random

proc quote*(name: string = ""): string =
  randomize()
  let roll = rand(3)
  const
    q01 = "ものすごいうそつき　でも … かっこいいうそつき！"
    q02 = "だいじょうぶます\nこわくない"
    q03f = "アーニャおうちかえりたい"
    q03l = "とアーニャのおうち"
    q04 = "アーニャじゃまなこども？"
  case roll
  of 0: return name & q01
  of 1: return q02
  of 2: return q03f & name & q03l
  of 3: return q04
  else: return ""