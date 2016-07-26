module Search where

import Node

--{-

ab d g n 
  | d==0 = score n
  | d>0 = let 
    ge = gen_all n
    ta = takeWhile (\x->x<g) $ map (\x->negate (ab (d-1) (1-g) x)) $ map (update n) ge
    in if length ta < length ge then g else maximum ta 

frame u l d n
  | u<=l+2 = g
  | u>l = let 
    cg = ab d g n
    in if cg==g then frame u g d n else frame g l d n 
  where g = div (u+l) 2

frameio u l d n
  | u<=l+2 = print (u,l,g)
  | u>l = do
      print (u,l,g)
      let cg = ab d g n
      if cg==g then frameio u g d n else frameio g l d n 
  where g = div (u+l) 2

---}

