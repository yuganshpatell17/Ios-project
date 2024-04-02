 
import Foundation

struct BrainVC {
    
    //MARK: Variables
    
    private var accumulator: Double?
    private var pendingBinaryOperation: PendingBinaryOperation?
    private var resultIsPending = false
    
    var description = ""
    var result: Double? { get { return accumulator } }
    
    //MARK: Enumerations
    
    private enum Operation {
        case constant(Double)
        case unaryOperation((Double) -> Double)
        case binaryOperation((Double, Double) -> Double)
        case result
    }
    
    private var operations: Dictionary<String, Operation> = [
        "＋" : .binaryOperation({ $0 + $1 }),
        "﹣" : .binaryOperation({ $0 - $1 }),
         "×" : .binaryOperation({ $0 * $1 }),
         "÷" : .binaryOperation({ $0 / $1 }),
         "√" : .unaryOperation({ sqrt($0) }),
         "±" : .unaryOperation({ -$0 }),
         "﹪" : .unaryOperation({ $0 / 100 }),
         "AC": .constant(0),
         "=" : .result
    ]
    
    //MARK: Embedded struct

    private struct PendingBinaryOperation {
        let function: (Double, Double) -> Double
        let firstOperand: Double
        
        func perform(with secondOperand: Double) -> Double {
            return function(firstOperand, secondOperand)
        }
    }
    
    //MARK: Functions
    
    private mutating func performPendingBinaryOperation() {
        if pendingBinaryOperation != nil && accumulator != nil {
            accumulator = pendingBinaryOperation?.perform(with: accumulator!)
            pendingBinaryOperation = nil
            resultIsPending = false
        }
    }
    
    mutating func performOperation(_ symbol: String) {
        if let operation = operations[symbol] {
            print(operation)
            switch operation {
                case .constant(let value):
                    accumulator = value
                    description = ""
                case .unaryOperation(let function):
                    if accumulator != nil {
                        let value = String(describing: accumulator!).removeAfterPointIfZero()
                        description = symbol + "(" + value.setMaxLength(of: 5) + ")" + "="
                        accumulator = function(accumulator!)
                    }
                case .binaryOperation(let function):
                    performPendingBinaryOperation()
                    
                    if accumulator != nil {
                        if description.last == "=" {
                            description = String(describing: accumulator!).removeAfterPointIfZero().setMaxLength(of: 5) + symbol
                        } else {
                            description += symbol
                        }
                        
                        pendingBinaryOperation = PendingBinaryOperation(function: function, firstOperand: accumulator!)
                        resultIsPending = true
                        accumulator = nil
                    }
                case .result:
                    performPendingBinaryOperation()
                    
                    if !resultIsPending {
                        description += " "
                    }
            }
        }
    }
    
    mutating func setOperand(_ operand: Double?) {
        accumulator = operand ?? 0.0
        if !resultIsPending {
            description = String(describing: operand!).removeAfterPointIfZero().setMaxLength(of: 5)
        } else {
            description += String(describing: operand!).removeAfterPointIfZero().setMaxLength(of: 5)
        }
    }
}


public extension String {
   
   // set the max length of the number to display
   func setMaxLength(of maxLength: Int) -> String {
       var tmp = self
       
       if tmp.count > maxLength {
           var numbers = tmp.map({$0})
           
           if numbers[maxLength - 1] == "." {
               numbers.removeSubrange(maxLength+1..<numbers.endIndex)
           } else {
               numbers.removeSubrange(maxLength..<numbers.endIndex)
           }
           
           tmp = String(numbers)
       }
       return tmp
   }
   
   // remove the '.0' when the number is not decimal
   func removeAfterPointIfZero() -> String {
       let token = self.components(separatedBy: ".")
       
       if !token.isEmpty && token.count == 2 {
           switch token[1] {
           case "0", "00", "000", "0000", "00000", "000000":
               return token[0]
           default:
               return self
           }
       }
       return self
   }
}
