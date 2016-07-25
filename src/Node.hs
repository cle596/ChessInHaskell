module Node where
import CData
import Data.List
import Data.List.Utils
import Data.Char
data Node = Root {
  t :: Bool,
  b :: String, 
  s :: Int
  }

gen_all n = concat $ map (gen n) [0..119]

(!) a b = genericIndex a b
foe n x = if (t n) then isLower ((b n)!x) else isUpper ((b n)!x)
foeOrDot n x = foe n x || (b n)!x=='.'

gen n x
  | c=='P' = pawn n x
  | c=='N' = knight n x
  | c=='B' = bishop n x bvec
  | c=='R' = bishop n x rvec
  | c=='Q' = bishop n x qvec
  | c=='K' = king n x
  | otherwise = []
  where 
    c=(b n)!x 

pawn n x = let 
  bo =(b n)
  upside = if bo!(x+up)=='.' then 
    if bo!(x+2*up)=='.'then [(x,(x+2*up)),(x,(x+up))] else [(x,(x+up))] 
    else []
  leftside = if (foe n (x+up+left)) then [(x,(x+up+left))] else []
  rightside = if foe n (x+up+right) then [(x,(x+up+right))] else []
  in merge upside $ merge leftside rightside

knight n x = let
  bo = (b n)
  in filter (\x->x/=(0,0)) [if foeOrDot n (x+v) then (x,x+v) else (0,0)|v<-nvec]

bishop n x vc = let
  bo = (b n)
  in map (\y->(x,y)) $ takeWhile (\y->foeOrDot n y) (map (\v->x+v) vc)

king n x = let
  bo = (b n)
  in filter (\x->x/=(0,0)) [if foeOrDot n (x+v) then (x,x+v) else (0,0)|v<-qvec]



