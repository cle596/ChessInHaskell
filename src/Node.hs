module Node where
import CData
import Data.List
import Data.Char
import Data.Maybe
import qualified Data.HashMap as Map
data Node = Root {
  turn :: Bool,
  board :: String, 
  ep :: Int
  }

gen_all n = concat $ map (gen n) [0..119]

(!) a b = genericIndex a b
cmp a b = fromIntegral a == fromIntegral b 
foe n x = isLower ((board n)!x)
dot n x = (board n)!x == '.'
foeOrDot n x = foe n x || (board n)!x=='.'

gen n x
  | c=='P' = pawn n x
  | c=='N' = knight n x
  | c=='B' = brq n x bvec
  | c=='R' = brq n x rvec
  | c=='Q' = brq n x qvec
  | c=='K' = king n x
  | otherwise = []
  where 
    c=(board n)!x 

pawn n x = let 
  bo =(board n)
  upside = if bo!(x+up)=='.' then 
    if bo!(x+2*up)=='.' && elem x init_pawn then [(x,(x+2*up)),(x,(x+up))] else [(x,(x+up))] 
    else []
  leftside = if foe n (x+up+left) || cmp (ep n) (x+up+left) then [(x,(x+up+left))] else []
  rightside = if foe n (x+up+right) || cmp (ep n) (x+up+right) then [(x,(x+up+right))] else []
  in upside++leftside++rightside

knight n x = let
  bo = (board n)
  in filter (\x->x/=(0,0)) [if foeOrDot n (x+v) then (x,x+v) else (0,0)|v<-nvec]

map_vc n x vc = map (\v->tkln n x v) vc
tkln n x v = let 
  lst = tk n x v
  la = if length lst>0 then last lst else 0
  in if length lst>0 && foe n (la+v) then lst++[la+v] else lst
tk n x v = takeWhile (\z->dot n z) $ map_scale n x v
map_scale n x v = map (\k->x+k*v) [1..7]

brq n x vc = map (\y->(x,y)) $ concat $ map_vc n x vc

king n x = let
  bo = (board n)
  in filter (\x->x/=(0,0)) [if foeOrDot n (x+v) then (x,x+v) else (0,0)|v<-qvec]

update n m = let
  f = fst m
  s = snd m
  in n {board=map (\x->if x==f then '.' else if x==s then (board n)!f else (board n)!x) [0..119]}

score n = let 
  bo = (board n)
  in sum $ map (\x->if elem (bo!x) pieces then sco (bo!x) x else 0) [0..119]

sco c x = let
  mat_s = mat $ fromJust $ Map.lookup c score_hash
  pst_s = (pst $ fromJust $ Map.lookup c score_hash)!!x
  in mat_s+pst_s

