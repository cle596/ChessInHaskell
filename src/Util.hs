module Util where 

import Data.List.Split
import Data.Char 
import Data.List
import CData
import Data.Maybe
import qualified Data.Bimap        as Bimap

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
    in if r=='\n' then ' ' else flop r) 
  [0..119]

flop x = if isAlpha x then if isUpper x then toLower x else toUpper x else x

trans x = let 
  m = mod x 10
  d = x-m
  l = fromJust $ Bimap.lookupR m trans_hash
  r = fromJust $ Bimap.lookupR d trans_hash
  in [l,r]

ttrans x = trans (fst x) ++ trans (snd x)

rtrans x = sum $ map (\x->fromJust $ Bimap.lookup x trans_hash) x 
rrtrans x = ((rtrans $ take 2 x), (rtrans $ drop 2 x))
