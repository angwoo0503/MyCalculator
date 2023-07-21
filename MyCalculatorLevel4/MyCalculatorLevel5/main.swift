enum Operator {
    case addition
    case subtraction
    case multiplication
    case division
}

class Calculator {
    let firstNum: Int
    let secondNum: Int
    let operatorType: Operator

    init(firstNum: Int, operatorType: Operator, secondNum: Int) {
        self.firstNum = firstNum
        self.operatorType = operatorType
        self.secondNum = secondNum
    }

    func calculate() -> Int? {
        switch operatorType {
        case .addition:
            return AddOperation().runOperation(firstNum: firstNum, secondNum: secondNum)
        case .subtraction:
            return SubtractOperation().runOperation(firstNum: firstNum, secondNum: secondNum)
        case .multiplication:
            return MultiplyOperation().runOperation(firstNum: firstNum, secondNum: secondNum)
        case .division:
            return DivideOperation().runOperation(firstNum: firstNum, secondNum: secondNum)
        }
    }
}

// Abstraction
class AbstractOperation {
    func runOperation(firstNum: Int, secondNum: Int) -> Int? {
        fatalError("runOperation() 메소드는 반드시 서브클래스에 의해 재정의 되어야 합니다.")
    }
}

// Addition
class AddOperation: AbstractOperation {
    override func runOperation(firstNum: Int, secondNum: Int) -> Int {
        return firstNum + secondNum
    }
}

// Subtraction
class SubtractOperation: AbstractOperation {
    override func runOperation(firstNum: Int, secondNum: Int) -> Int {
        return firstNum - secondNum
    }
}

// Multiplication
class MultiplyOperation: AbstractOperation {
    override func runOperation(firstNum: Int, secondNum: Int) -> Int {
        return firstNum * secondNum
    }
}

// Division
class DivideOperation: AbstractOperation {
    override func runOperation(firstNum: Int, secondNum: Int) -> Int? {
        guard secondNum != 0 else {
            print("0으로는 나눌 수 없습니다.")
            return nil
        }
        return firstNum / secondNum
    }
}

func runCalculator() {
    print("첫번째 수를 입력해주세요. :")
    let firstNum = Int(readLine()!)!
    
    print("연산자를 선택해주세요. (+, -, *, /):")
    let operatorSymbol = readLine()!
    let operatorType: Operator
    
    switch operatorSymbol {
    case "+":
        operatorType = .addition
    case "-":
        operatorType = .subtraction
    case "*":
        operatorType = .multiplication
    case "/":
        operatorType = .division
    default:
        print("존재하지 않는 연산자입니다.")
        return
    }
    
    print("두번째 수를 입력해주세요.:")
    let secondNum = Int(readLine()!)!

    let calculator = Calculator(firstNum: firstNum, operatorType: operatorType, secondNum: secondNum)

    if let result = calculator.calculate() {
        print("결과: \(result)")
    } else {
        print("유효하지 않은 연산이니 다시 한 번 확인해주세요.")
    }
}

runCalculator()
