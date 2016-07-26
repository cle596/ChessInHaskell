module Search where

import Node

--{-

ab d g n 
  | d>0 = let 
    ge = gen_all n
    ta = takeWhile (\x->x<g) $ map (negate . (ab (d-1) (1-g))) $ map (update n) ge
    in if length ta < length ge then g else maximum ta 
  | d==0 = score n


---}

