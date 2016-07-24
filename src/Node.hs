module Node where
import CData
import Data.List
data Node = Root {
  b :: String, 
  s :: Int
  }

gen_all n = concat $ map (gen n) [0..119]

(!)::Integral b=>[a]->b->a 
(!) a b = genericIndex a b

gen n x
  | c=='P' = pawn n x
  | otherwise = []
  where 
    c=(b n)!x 

pawn n x = (x,(x+up)):[]
  




