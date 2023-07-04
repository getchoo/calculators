calculate :: String -> Float -> Float -> Float
calculate operator number1 number2 = case operator of
  "+" -> number1 + number2
  "-" -> number1 - number2
  "/" -> number1 / number2
  "*" -> number1 * number2
  _ -> error "invalid operator!"

main :: IO()
main = do
  putStr "enter a number: "
  input<-getLine
  let number1 = (read input :: Float)

  putStr "enter an operator: "
  operator<-getLine

  putStr "enter another number: "
  input<-getLine
  let number2 = (read input :: Float)

  print (calculate operator number1 number2)
