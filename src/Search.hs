module Search where

import Node

{-

ab d g n 
  | d>0 = let 
    ge = gen_all n
    ta = takeWhile (\x->x<=g) $ map $ -(ab (d-1) (1-g) n) $ ge
    in if length ge < length ta then g else maximum ta 
  | d==0 = score n


-}

