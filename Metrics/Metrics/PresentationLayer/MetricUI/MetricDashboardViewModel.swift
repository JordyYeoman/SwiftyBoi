import Observation
import SwiftUI

@Observable
class MetricDashboardViewModel {
    private let service: Service

    var metrics: [Metric]?
    var error: APIError?
    var isFetching: Bool = false
    var recentMetrics: [Metric] {
        guard let _metrics = metrics else {
            return []
        }

        let sortedMetrics = _metrics.reversed().sorted {
            // Convert date strings to Date objects for comparison
            let dateFormatter = DateFormatter()
            dateFormatter.dateFormat = "dd/MM/yyyy"
            
            guard let date1 = dateFormatter.date(from: $0.date),
                  let date2 = dateFormatter.date(from: $1.date) else {
                return false
            }
            
            return date1 > date2
        }
        
        return sortedMetrics
    }

    func fetchData() {
        self.isFetching = true
        let request = MetricSheetsEndpoint.getMetrics()
        service.makeRequest(
            with: request,
            respModel: [Metric].self
        ) {
            [weak self] metrics, error in
            DispatchQueue.main.async {
                if let error = error {
                    self?.error = error
                    self?.isFetching = false
                    return
                }
                self?.metrics = metrics
                self?.isFetching = false
            }
        }
    }
    
    init(service: Service = APIService()) {
        self.service = service
    }
}
