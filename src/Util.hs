module Util where 

import Data.List.Split
import Data.Char 
import Data.List

parse_fen x = pad $ intercalate "\n" $ map make_line $ splitOn "/" x
make_line x = intercalate "" $ map test x
test x 
  | isDigit x = intercalate "" $ drop 1 $ splitOn "" $ replicate (digitToInt x) '.'
  | isAlpha x = [x]

pad x = replicate 19 ' ' ++
  "\n" ++
  intercalate "" (map (\x->" "++x++"\n") (splitOn "\n" x)) ++
  replicate 20 ' '

unpad x = intercalate "\n" $ map (\x->(take 8 (drop 1 x))) (take 8 (drop 1 (splitOn "\n" x)))

pretty x = intercalate " " $ splitOn "" x

rot x = map 
  (\y->if x!!y=='\n' then x!!y else
    let r=x!!(((11-(div y 10))*10)+(9-(mod y 10)))
    in if r=='\n' then ' ' else r) 
  [0..119]