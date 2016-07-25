import Node
import Search
import Util

root = Root 
  True
  (parse_fen "rnbqkbnr/pppppppp/8/8/8/8/PPPPPPPP/RNBQKBNR") 
  0

main = do
  putStrLn $ pretty $ b root
  print $ gen_all root
