module Util where 

import Data.List.Split
import Data.Char 
import Data.List

parse_fen x = pad $ intercalate "\n" $ map make_line $ splitOn "/" x
make_line x = intercalate "" $ map test x
test x 
  | isDigit x = intercalate "" $ drop 1 $ splitOn "" $ replicate (digitToInt x) '.'
  | isAlpha x = [x]

pad x = replicate 19 ' ' ++ "\n" ++
  intercalate "" (map (\x->" "++x++"\n") (splitOn "\n" x)) ++
  replicate 9 ' ' ++ "\n" ++ replicate 10 ' '

unpad x = intercalate "\n" $ map (\x->(take 8 (drop 1 x))) (take 8 (drop 1 (splitOn "\n" x)))

pretty x = intercalate " " $ splitOn "" x
