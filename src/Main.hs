import Node
import Search
import Util

root = Root 
  (parse_fen "rnbqkbnr/pppppppp/8/8/8/8/PPPPPPPP/RNBQKBNR") 
  0

main = do
  putStrLn $ pretty $ b root
  putStrLn $ pretty $ rot $ b root
