import Observation
import SwiftUI

@Observable class StackzViewModel {
    var textBinding = ""
    let placeholder: String = "Min $5"

    private let numberFormatter: NumberFormatter

    init() {
        numberFormatter = NumberFormatter()
        numberFormatter.numberStyle = .currency
        numberFormatter.currencySymbol = "$"
        numberFormatter.maximumFractionDigits = 2
    }

     func formatText(text: String) -> Void {
         let formattedValue = text.replacingOccurrences(
            of: "[^0-9.$]", with: "", options: .regularExpression)
         let val = formattedValue != "" ? "$\(formattedValue)" : ""
         
         let t = numberFormatter.number(from: val)
//
//        if let y = Double(cleanedText) {
//            if let k = numberFormatter.string(from: NSNumber(floatLiteral: y)) {
//                return k
//            }
//        }
//
//        return cleanedText
    }
}
