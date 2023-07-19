class Calculator{
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
        case "+" : return AddOperation().runOperation(firstNum:firstNum,secondNum:secondNum)
        case "-" : return SubtractOperation().runOperation(firstNum:firstNum,secondNum:secondNum)
        case "*" : return MultiplyOperation().runOperation(firstNum:firstNum,secondNum:secondNum)
        case "/" : return DivideOperation().runOperation(firstNum:firstNum,secondNum:secondNum)
        default:
            return nil
        }
    }
}

// 추상화
class AbstractOperation {
    func runOperation(firstNum: Int, secondNum: Int) -> Int {
        fatalError("runOperation() 메서드는 반드시 서브클래스에 의해 재정의 되어야 한다.")
    }
}

// 더하기
class AddOperation: AbstractOperation {
    override func runOperation(firstNum: Int, secondNum: Int) -> Int {
        return firstNum + secondNum
    }
}

// 빼기
class SubtractOperation: AbstractOperation {
    override func runOperation(firstNum: Int, secondNum: Int) -> Int {
        return firstNum - secondNum
    }
}

// 곱하기
class MultiplyOperation: AbstractOperation {
    override func runOperation(firstNum: Int, secondNum: Int) -> Int {
        return firstNum * secondNum
    }
}

// 나누기
class DivideOperation: AbstractOperation {
    override func runOperation(firstNum: Int, secondNum: Int) -> Int {
        guard secondNum != 0 else {
            fatalError("0으로는 나눌 수 없습니다.")
        }
        return firstNum / secondNum
    }
}




let calculator = Calculator(firstNum: 5, operators: "/", secondNum: 3)
if let result = calculator.calculate() {
    print("계산 결과: \(result)")
} else {
    print("유효하지 않은 연산.")
}

/*
 레벨 3과 비교하자면 레벨 4는 AbstractOperation이라는 클래스를 통해 공통된 기능을 추상화했고 실제 연산을 구현하는 서브클래스를 생성하는 방식이다. 이렇게하여 Calculator 클래스 내부의 대한 정보를 알 필요가 없어 Calculator 클래스와 실제 다른 연산 클래스들의 결합도가 낮아져 한 클래스의 변경이 다른 클래스에 영향을 덜 주며 유지보수와 확장이 용이해졌다.
 
 Calculator 클래스는 AbstractOperation이라는 추상 클래스에 의존하고 실제 연산 클래스 또한 AbstractOperation 클래스에 의존한다. 즉 고수준 모듈 (Calculator)은 저수준 모듈 (네 개의 연산자 클래스)에 의존하지 않고 추상화 클래스에 의존하게 된다. 결국 의존성 역전 원칙이 적용되어 구체적인 구현에 의존하던 Calculator 클래스가 추상화에 의존하게 되는 것이다.
 */
