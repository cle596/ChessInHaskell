module CData where

import Data.List.Utils
import qualified Data.HashMap as Map
import qualified Data.Bimap        as Bimap

up = -10
down = 10
right = 1
left = -1

nvec = [
  2*up+right, 2*up+left,
  2*down+right, 2*down+left,
  up+2*right, up+2*left,
  down+2*right, down+2*left ]

bvec = [
  up+right, up+left,
  down+right, down+left ]

rvec = [
  up, down,
  right, left ]

qvec = merge bvec rvec

pawn_pst = [
  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,
  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,
  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,
  0, 50, 50, 50, 50, 50, 50, 50, 50,  0,
  0, 10, 10, 20, 30, 30, 20, 10, 10,  0,
  0,  5,  5, 10, 25, 25, 10,  5,  5,  0,
  0,  0,  0,  0, 20, 20,  0,  0,  0,  0,
  0,  5, -5,-10,  0,  0,-10, -5,  5,  0,
  0,  5, 10, 10,-20,-20, 10, 10,  5,  0,
  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,
  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,
  0,  0,  0,  0,  0,  0,  0,  0,  0,  0
  ]

knight_pst = [
  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,
  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,
  0,-50,-40,-30,-30,-30,-30,-40,-50,  0,
  0,-40,-20,  0,  0,  0,  0,-20,-40,  0,
  0,-30,  0, 10, 15, 15, 10,  0,-30,  0,
  0,-30,  5, 15, 20, 20, 15,  5,-30,  0,
  0,-30,  0, 15, 20, 20, 15,  0,-30,  0,
  0,-30,  5, 10, 15, 15, 10,  5,-30,  0,
  0,-40,-20,  0,  5,  5,  0,-20,-40,  0,
  0,-50,-40,-30,-30,-30,-30,-40,-50,  0,
  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,
  0,  0,  0,  0,  0,  0,  0,  0,  0,  0
  ]

bishop_pst = [
  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,
  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,
  0,-20,-10,-10,-10,-10,-10,-10,-20,  0,
  0,-10,  0,  0,  0,  0,  0,  0,-10,  0,
  0,-10,  0,  5, 10, 10,  5,  0,-10,  0,
  0,-10,  5,  5, 10, 10,  5,  5,-10,  0,
  0,-10,  0, 10, 10, 10, 10,  0,-10,  0,
  0,-10, 10, 10, 10, 10, 10, 10,-10,  0,
  0,-10,  5,  0,  0,  0,  0,  5,-10,  0,
  0,-20,-10,-10,-10,-10,-10,-10,-20,  0,
  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,
  0,  0,  0,  0,  0,  0,  0,  0,  0,  0
  ]

rook_pst = [
  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,
  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,
  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,
  0,  5, 10, 10, 10, 10, 10, 10,  5,  0,
  0, -5,  0,  0,  0,  0,  0,  0, -5,  0,
  0, -5,  0,  0,  0,  0,  0,  0, -5,  0,
  0, -5,  0,  0,  0,  0,  0,  0, -5,  0,
  0, -5,  0,  0,  0,  0,  0,  0, -5,  0,
  0, -5,  0,  0,  0,  0,  0,  0, -5,  0,
  0,  0,  0,  0,  5,  5,  0,  0,  0,  0,
  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,
  0,  0,  0,  0,  0,  0,  0,  0,  0,  0
  ]

queen_pst = [
  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,
  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,
  0,-20,-10,-10, -5, -5,-10,-10,-20,  0,
  0,-10,  0,  0,  0,  0,  0,  0,-10,  0,
  0,-10,  0,  5,  5,  5,  5,  0,-10,  0,
  0, -5,  0,  5,  5,  5,  5,  0, -5,  0,
  0,  0,  0,  5,  5,  5,  5,  0, -5,  0,
  0,-10,  5,  5,  5,  5,  5,  0,-10,  0,
  0,-10,  0,  5,  0,  0,  0,  0,-10,  0,
  0,-20,-10,-10, -5, -5,-10,-10,-20,  0,
  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,
  0,  0,  0,  0,  0,  0,  0,  0,  0,  0
  ]

king_pst = [
  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,
  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,
  0,-30,-40,-40,-50,-50,-40,-40,-30,  0,
  0,-30,-40,-40,-50,-50,-40,-40,-30,  0,
  0,-30,-40,-40,-50,-50,-40,-40,-30,  0,
  0,-30,-40,-40,-50,-50,-40,-40,-30,  0,
  0,-20,-30,-30,-40,-40,-30,-30,-20,  0,
  0,-10,-20,-20,-20,-20,-20,-20,-10,  0,
  0, 20, 20,  0,  0,  0,  0, 20, 20,  0,
  0, 20, 30, 10,  0,  0, 10, 30, 20,  0,
  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,
  0,  0,  0,  0,  0,  0,  0,  0,  0,  0
  ]

trans_hash = Bimap.fromList[
  ('a', 1), ('b', 2), ('c', 3),('d',4),
  ('e', 5), ('f', 6), ('g', 7),('h',8),
  ('1', 90), ('2', 80), ('3', 70),('4',60),
  ('5', 50), ('6', 40), ('7', 30),('8',20)
  ]

init_pawn = [81..88]

data Points = PTS {
  mat :: Integer,
  pst :: [Integer]
  }

pieces = ['P','N','B','R','Q','K',
  'p','n','b','r','q','k']

score_hash = Map.fromList[
  ('P',PTS 100 pawn_pst),
  ('N',PTS 320 knight_pst),
  ('B',PTS 330 bishop_pst),
  ('R',PTS 500 rook_pst),
  ('Q',PTS 900 queen_pst),
  ('K',PTS 20000 king_pst),
  ('p',PTS (-100) (rot_pst pawn_pst)),
  ('n',PTS (-320) (rot_pst knight_pst)),
  ('b',PTS (-330) (rot_pst bishop_pst)),
  ('r',PTS (-500) (rot_pst rook_pst)),
  ('q',PTS (-900) (rot_pst queen_pst)),
  ('k',PTS (-20000) (rot_pst king_pst))
  ]

rot_pst x = map 
  (\y->let 
    a=(11-(div y 10))*10
    b=mod y 10
    in -(x!!(a+b))) 
  [0..119]

end = 20000
