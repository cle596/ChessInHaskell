import Node
import Search
import Util
import CData

root = Root True (parse_fen "rnbqkbnr/pppppppp/8/8/8/8/PPPPPPPP/RNBQKBNR") 0 0

main = do
  putStrLn $ pretty $ b root
  print $ map ttrans $ gen_all root
