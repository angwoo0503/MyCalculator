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
        case "+" : return AddOperation(firstNum: firstNum, operators: "+", secondNum: secondNum).result
        case "-" : return SubtractOperation(firstNum: firstNum, operators: "-", secondNum: secondNum).result
        case "*" : return MultiplyOperation(firstNum: firstNum, operators: "*", secondNum: secondNum).result
        case "/" : return DivideOperation(firstNum: firstNum, operators: "/", secondNum: secondNum).result
        default:
            return nil
        }
    }
}



class AddOperation: Calculator{
    var result: Int {
        let result = firstNum + secondNum
        return result
    }
}
class SubtractOperation: Calculator {
    var result: Int {
        let result = firstNum - secondNum
        return result
    }
}
class MultiplyOperation: Calculator {
    var result: Int {
        let result = firstNum * secondNum
        return result
    }
}
class DivideOperation: Calculator {
    var result: Int? {
        guard secondNum != 0 else {
            return nil
        }
        return firstNum / secondNum
    }
}






let calculator = Calculator(firstNum: 5, operators: "+", secondNum: 3)
if let result = calculator.calculate() {
    print("결과: \(result)")
} else {
    print("유효하지 않은 연산이니 다시 한 번 확인해주세요.")
}


/*
 레벨2와 다른점
 각 연산에 대한 책임이 해당 연산을 처리하는 개별 클래스에만 명확하게 할당된다. 각 클래스는 특정 연산에 대한 구체적인 책임을 가지며
 변경 사항이 해당 연산에만 영향을 미친다. 결론 : 클래스의 역할과 책임이 명확해지고 코드의 가독성과 이해도가 향상된다.
 
 예를 들어 DivideOperation 같은 경우 나누게 되는 수인 secondNum이 0일 때는 연산이 불가능하기 때문에 그런 예외를 처리할 때 해당 클래스만 수정하면 되기에 각 연산을 클래스로 나누는 것이 유리하다.
 */
