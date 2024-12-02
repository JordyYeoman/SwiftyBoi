import Foundation
import UIKit
import SwiftUI
import Testing



actor XXX {
    func call() {

    }
}

let xxx = XXX()

let x: @Sendable () async -> Void = {
    await xxx.call()
}

print("hello world")
