enum InvalidOperatorError: Error {
    case operatorNotSupported
}

func calculate(operatorThing: String, number1: Float, number2: Float) throws -> Float {
    switch operatorThing {
    case "+":
        return number1 + number2
    case "-":
        return number1 - number2
    case "/":
        return number1 / number2
    case "*":
        return number1 * number2
    default:
       throw InvalidOperatorError.operatorNotSupported
    }
}


func main() {
    print("enter a number:")
    let number1 = Float(readLine()!)!
    print("enter an operator:")
    let operatorThing = readLine()!
    print("enter another number:")
    let number2 = Float(readLine()!)!
    
    do {
        let result = try calculate(operatorThing: operatorThing, number1: number1, number2: number2) 
        print(result)
    } catch InvalidOperatorError.operatorNotSupported {
        print("invalid operator!")
        return
    } catch {
        print("unexpected error!")
        return
    }
}

main()
