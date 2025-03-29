import Foundation

extension String {
    var uuidString: String? {
        if self.contains("dude") {
            return "brrraaa \(self)"
        }
        
        return nil
    }
}
