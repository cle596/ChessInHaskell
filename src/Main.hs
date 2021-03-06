import Node
import Search
import Util
import CData
import qualified Data.HashMap as Map
import Data.Maybe

root = Root True (parse_fen "rnbqkbnr/pppppppp/8/8/8/8/PPPPPPPP/RNBQKBNR") (0,0) 0

loop n = do
  putStrLn $ pretty $ board n
  let g = gen_all n
  --print $ map ttrans $ g
  --putStr "score: "
  --print $ score n
  --print $ ab 4 0 n 
  --let bm = frame end (negate end) 4 n "null"
  --print bm
  frameio end (negate end) 5 n "null"
  i <- getLine
  if elem (rrtrans i) g then loop (update n (rrtrans i)) else putStrLn "no"

main = do
  loop root
