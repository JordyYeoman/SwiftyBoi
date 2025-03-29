import Foundation

struct WalletMethod {
    enum Kind: String {
        case nppBankTransfer = "npp"
        case eftBankTransfer = "eft"
    }
    
    let label: String
    let name: String
    let slug: String
    let isInstant: Bool
    
    var kind: Kind? {
        Kind(rawValue: slug)
    }
}

let withdrawMethod1 = WalletMethod(label: "Bank Transfer", name: "npp-transfer", slug: "npp", isInstant: true)
let withdrawMethod2 = WalletMethod(label: "Bank Transfer2", name: "npp-transfer", slug: "npp2", isInstant: true)
let withdrawMethod3 = WalletMethod(label: "Bank Transfer3", name: "eft-transfer", slug: "eft", isInstant: false)
let withdrawMethod4 = WalletMethod(label: "PayPal", name: "PayPal", slug: "PayPal", isInstant: true)
let withdrawMethod5 = WalletMethod(label: "Oski", name: "Oski", slug: "Oski", isInstant: true)

var methods: [WalletMethod] = [
    withdrawMethod1,
    withdrawMethod2,
    withdrawMethod3,
    withdrawMethod4,
    withdrawMethod5
]

// Check if npp-transfer is available, if it is make sure to filter out EFT bank transfer
let nppAvailable = methods.contains(where: { $0.kind == .nppBankTransfer })
if nppAvailable {
    methods = methods.filter({ $0.kind != .eftBankTransfer })
}

print("Methods Available: ", methods)
