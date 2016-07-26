module Search where

import Node

--{-

ab d g n 
  | d>0 = let 
    ge = gen_all n
    ta = takeWhile (\x->x<g) $ map (negate . (ab (d-1) (1-g))) $ map (update n) ge
    in if length ta < length ge then g else maximum ta 
  | d==0 = score n

frame u l d n
  | u<=l = g
  | u>l = let 
    cg = ab d g n
    in if cg==g then frame u g d n else frame g l d n 
  where g = div (u+l+1) 2

---}

