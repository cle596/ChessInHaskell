import Node
import Search
import Util
import CData

root = Root True (parse_fen "rnbqkbnr/pppppppp/8/8/8/8/PPPPPPPP/RNBQKBNR") 0 0

loop n = do
  putStrLn $ pretty $ b n
  let g = gen_all n
  print $ map ttrans $ g
  i <- getLine
  if elem (rrtrans i) g then loop n{b=rot $ update n (rrtrans i)} else putStrLn "no"

main = do
  loop root
