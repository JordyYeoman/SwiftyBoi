import Foundation

struct MetricSheetsEndpoint {
    static let baseURL = "http://localhost:3000/api/metrics/all"
    
    static func getMetrics() -> URLRequest {
        let urlString = "\(baseURL)/?sheet=Entain%20Improvement"
        guard let url = URL(string: urlString) else {
            fatalError("Invalid URL")
        }
        
        var request = URLRequest(url: url)
        request.httpMethod = "GET"
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
        return request
    }
}
