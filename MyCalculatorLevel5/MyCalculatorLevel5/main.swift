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
    func runOperation(firstNum: Int, secondNum: Int) -> Int? {
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
    override func runOperation(firstNum: Int, secondNum: Int) -> Int? {
        guard secondNum != 0 else {
            print("0으로는 나눌 수 없습니다.")
            return nil
        }
        return firstNum / secondNum
    }
}


func runCalculator() {
    print("숫자를 입력해주세요.")
    let firstNum = Int(readLine()!)!
    print("연산자를 입력해주세요.")
    let operators = readLine()!
    print("숫자를 입력해주세요.")
    let secondNum = Int(readLine()!)!
    
    let calculator = Calculator(firstNum: firstNum, operators: operators, secondNum: secondNum)
    
    if let result = calculator.calculate() {
        print("결과: \(result)")
    } else {
        print("유효하지 않은 연산이니 다시 한 번 확인해주세요.")
    }
}

runCalculator()




/*
 레벨2와 다른점
 각 연산에 대한 책임이 해당 연산을 처리하는 개별 클래스에만 명확하게 할당된다. 각 클래스는 특정 연산에 대한 구체적인 책임을 가지며
 변경 사항이 해당 연산에만 영향을 미친다. 결론 : 클래스의 역할과 책임이 명확해지고 코드의 가독성과 이해도가 향상된다.
 
 예를 들어 DivideOperation 같은 경우 나누게 되는 수인 secondNum이 0일 때는 연산이 불가능하기 때문에 그런 예외를 처리할 때 해당 클래스만 수정하면 되기에 각 연산을 클래스로 나누는 것이 유리하다.
 */


