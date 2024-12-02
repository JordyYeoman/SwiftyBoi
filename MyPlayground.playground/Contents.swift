var str = "Hello, Jordy"
var myNumber = 5 * 4
print(myNumber)


//struct User {
//    let username: String
//    var isVisible: Bool = true
//    var friends: [String] = []
//
//    mutating func addFriend(username: String) throws {
//        guard username != self.username else {
//            throw SocialError.befriendingSelf
//        }
//        guard !friends.contains(username) else {
//            throw SocialError.duplicateFriend(username: username)
//        }
//        friends.append(username)
//    }
//}
//
//enum SocialError: Error {
//    case befriendingSelf
//    case duplicateFriend(username: String)
//}
//
//var alice = User(username: "alice")
//do {
//    try alice.addFriend(username: "charlie")
//    try alice.addFriend(username: "charlie")
//} catch {
//    error
//}
//
//print("HELLO")
