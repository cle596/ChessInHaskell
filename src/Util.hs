module Util where 

import Data.List.Split
import Data.Char 
import Data.List

parse_fen x = intercalate "\n" $ map make_line $ splitOn "/" x
make_line x = intercalate "" $ map test x
test x 
  | isDigit x = intercalate "" $ drop 1 $ splitOn "" $ replicate (digitToInt x) '.'
  | isAlpha x = [x]

pad x = replicate 19 ' ' ++ "\n" ++
  intercalate "" (map (\x->"  "++x++" \n") (splitOn "\n" x)) ++
  replicate 9 ' ' ++ "\n" ++ replicate 10 ' '

pretty x = intercalate " " $ splitOn "" x
