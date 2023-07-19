class Calculator {
    let firstNum : Int
    let secondNum : Int
    let operators : String
    
    init(firstNum: Int, operators: String, secondNum: Int) {
        self.firstNum = firstNum
        self.operators = operators
        self.secondNum = secondNum
    }
    
    func calculate() -> Int? {
        switch operators {
        case "+" : return firstNum + secondNum
        case "-" : return firstNum - secondNum
        case "*" : return firstNum * secondNum
        case "/" : return firstNum / secondNum
        case "%" : return firstNum % secondNum
        default:
            return nil
        }
    }
}


let calculator = Calculator(firstNum: 5, operators: "%", secondNum: 3)
if let result = calculator.calculate() {
    print("결과: \(result)")
} else {
    print("유효하지 않은 연산이니 다시 한 번 확인해주세요.")
}
