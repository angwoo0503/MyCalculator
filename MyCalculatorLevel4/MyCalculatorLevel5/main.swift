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

/*
 레벨 3과 비교하자면 레벨 4는 AbstractOperation이라는 클래스를 통해 공통된 기능을 추상화했고 실제 연산을 구현하는 서브클래스를 생성하는 방식이다. 이렇게하여 Calculator 클래스 내부의 대한 정보를 알 필요가 없어 Calculator 클래스와 실제 다른 연산 클래스들의 결합도가 낮아져 한 클래스의 변경이 다른 클래스에 영향을 덜 주며 유지보수와 확장이 용이해졌다.
 
 Calculator 클래스는 AbstractOperation이라는 추상 클래스에 의존하고 실제 연산 클래스 또한 AbstractOperation 클래스에 의존한다. 즉 고수준 모듈 (Calculator)은 저수준 모듈 (네 개의 연산자 클래스)에 의존하지 않고 추상화 클래스에 의존하게 된다. 결국 의존성 역전 원칙이 적용되어 구체적인 구현에 의존하던 Calculator 클래스가 추상화에 의존하게 되는 것이다.
 */
