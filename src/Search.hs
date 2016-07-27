module Search where

import Node
import Util
import Data.List
import Data.Function
import CData

takeWhileInc p x = let 
  t = takeWhile p x 
  in if length t < length x then take ((length t)+1) x else t  

ab d g n 
  | d==0 = (score n,"ply0")
  | d>0 = let 
    ge = gen_all n
    ta = takeWhileInc (\x->(fst x)<g) $ map (\x->((negate (fst (ab (d-1) (1-g) x))),(ttrans (move x)))) $ map (update n) ge
    in last $ sortBy (compare `on` fst) ta 

frame u l d n m
  | u<=l+2 = m --g
  | u>l = let 
    cg = ab d g n 
    in if (fst cg)==g then frame u g d n (snd cg) else frame g l d n (snd cg) 
  where g = div (u+l) 2

frameio u l d n m
  | u<=l+2 = print (u,l,g,m)
  | u>l+2 = do
      print (u,l,g,m)
      let cg = ab d g n
      if (fst cg)>=g then frameio u g d n (snd cg) else frameio g l d n (snd cg)
  where g = div (u+l) 2


