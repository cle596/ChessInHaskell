module Node where
import CData
data Node = Root {
  b :: String, 
  s :: Int
  }

gen_all n = concat $ map (gen n) [0..119]

gen n x = let 
  g=[]
  y=(fromIntegral x::Int) 
  c=(b n)!!y in 
  if c=='P' then (x,(x+up)):g else g



