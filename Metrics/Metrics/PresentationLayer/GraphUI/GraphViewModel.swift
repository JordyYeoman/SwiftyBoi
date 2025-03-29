import Observation
import SwiftUI

@Observable
class GraphViewModel {
    private let service: Service

    var metrics: [Metric]?
    var error: APIError?
    var isFetching: Bool = false

    init(service: Service = APIService()) {
        self.service = service
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
}
