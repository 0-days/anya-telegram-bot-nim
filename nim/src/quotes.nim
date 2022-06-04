import std / random
import std / strformat

proc quote*(name: string = ""): string =
  randomize()
  let roll = rand(2)
  const
    q01 = "ものすごいうそつき　でも … かっこいいうそつき！"
    q02 = "だいじょうぶます\nこわくない"
    q03f = "アーニャおうちかえりたい"
    q03l = "とアーニャのおうち"
  case roll
  of 0: return name & q01
  of 1: return q02
  of 2: return q03f & name & q03l
  else: return ""