module Util where 

import Data.List.Split
import Data.Char 
import Data.List

parse_fen x = intercalate "\n" $ map make_line $ splitOn "/" x
make_line x = intercalate " " $ map test x
test x 
  | isDigit x = intercalate " " $ drop 1 $ splitOn "" $ replicate (digitToInt x) '.'
  | isAlpha x = [x]
