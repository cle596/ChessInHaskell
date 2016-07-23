import System.IO

print_and_flush x = do
  putStrLn x 
  hFlush stdout

get_from_gui = do
  g <- getLine  
  appendFile "/home/ch/Desktop/x.txt" $ g++"\n"
  send_to_gui g
  get_from_gui

send_to_gui g
  | g=="protover 2" = print_and_flush "feature setboard=1 done=1"
  | g=="go" = print_and_flush "move d2d4"
  | otherwise = putStr ""

main = do
  get_from_gui
