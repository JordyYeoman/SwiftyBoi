import Foundation

struct Post: Codable {
    // The names of the variables should match with the keys used in the link. Also, the data types should match with the values of the URL link.
    let userId: Int
    let id: Int
    let title: String
    let body: String
}

let url = URL(string: "https://jsonplaceholder.typicode.com/posts")!
var request = URLRequest(url: url)
request.httpMethod = "GET"  // optional
request.setValue("application/json", forHTTPHeaderField: "Content-Type")

let task = URLSession.shared.dataTask(with: request) { data, response, error in
    if let error = error {
        print("Error while fetching data:", error)
        return
    }

    guard let data = data else {
        return
    }

    do {
        let posts = try JSONDecoder().decode([Post].self, from: data)  // Since the JSON in the URL starts with array([]), we will be using [Post].self. If the JSON starts with curly braces ({}), use Post.self
        // Fetching each element from array
        for post in posts {
            print("User ID:", post.userId)
            print("Id:", post.id)
            print("Title:", post.title)
            print("Body:", post.body)
        }
    } catch let jsonError {
        print("Failed to decode json", jsonError)
    }

}

task.resume()
