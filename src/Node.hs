module Node where
import CData
import Data.List
data Node = Root {
  b :: String, 
  s :: Int
  }

gen_all n = concat $ map (gen n) [0..119]

gen n x
  | c=='P' = (x,(x+up)):g 
  | otherwise = g
  where 
    g=[]
    c=genericIndex (b n) x 

--pawn n x = 




