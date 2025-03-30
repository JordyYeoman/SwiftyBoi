import Charts
import SwiftUI

struct MetricsDashboard: View {
    @State private var viewModel = MetricDashboardViewModel()
    @State private var selectedChartMetric: ChartMetricType = .timeSpentCoding
    @State private var selectedTimeframe: ChartTimeFrames = .lastWeek

    // Date formatter for display
    private var dateFormatter: DateFormatter {
        let formatter = DateFormatter()
        formatter.dateFormat = "dd/MM/yyyy"
        formatter.dateStyle = .medium
        return formatter
    }

    var body: some View {
        ScrollView {
            VStack(spacing: 20) {
                Text("Dev Metrics")
                    .font(.largeTitle)
                    .fontWeight(.bold)
                    .padding(.top)

                // Chart section
                VStack(alignment: .leading) {
                    Text("Recent Trends")
                        .font(.headline)
                        .padding(.leading)

                    Picker("Timeframe", selection: $selectedTimeframe) {
                        ForEach(ChartTimeFrames.allCases, id: \.self) {
                            timeframe in
                            Text(timeframe.displayName).tag(timeframe)
                        }
                    }
                    .pickerStyle(SegmentedPickerStyle())
                    .padding(.horizontal)

                    Picker("Metric", selection: $selectedChartMetric) {
                        ForEach(ChartMetricType.allCases, id: \.self) {
                            metricType in
                            Text(metricType.displayName).tag(metricType)
                        }
                    }
                    .pickerStyle(SegmentedPickerStyle())
                    .padding(.horizontal)

                    // Chart
                    Chart {
                        ForEach(
                            (selectedTimeframe.data(
                                for: viewModel.recentMetrics)), id: \.date
                        ) { metric in
                            LineMark(
                                x: .value(
                                    "Date", formatDateForChart(metric.date)),
                                y: .value(
                                    selectedChartMetric.displayName,
                                    selectedChartMetric.value(for: metric))
                            )
                            .foregroundStyle(Color.blue)
                            .symbol(Circle())

                            PointMark(
                                x: .value(
                                    "Date", formatDateForChart(metric.date)),
                                y: .value(
                                    selectedChartMetric.displayName,
                                    selectedChartMetric.value(for: metric))
                            )
                            .foregroundStyle(Color.red)
                        }
                    }
                    .frame(height: 250)
                    .padding()
                    .chartYScale(
                        domain:
                            0...selectedChartMetric.maxValue(
                                in: viewModel.recentMetrics))
                }
                .background(Color.gray.opacity(0.1))
                .cornerRadius(10)
                .padding()

                ForEach(viewModel.recentMetrics, id: \.date) { metric in
                    MetricRow(metric: metric)
                }

            }
            .padding()
            .onAppear {
                viewModel.fetchData()
            }
        }
    }

    // Format date for chart display
    private func formatDateForChart(_ dateString: String) -> String {
        let inputFormatter = DateFormatter()
        inputFormatter.dateFormat = "dd/MM/yyyy"

        guard let date = inputFormatter.date(from: dateString) else {
            return dateString
        }

        let outputFormatter = DateFormatter()
        outputFormatter.dateFormat = "dd/MM"
        return outputFormatter.string(from: date)
    }
}

// Row view for individual metrics
struct MetricRow: View {
    let metric: Metric

    var body: some View {
        VStack(alignment: .leading, spacing: 8) {
            Text(formatDate(metric.date))
                .font(.headline)

            HStack(spacing: 20) {
                MetricItemView(
                    label: "Coding", value: "\(metric.timeSpentCoding) min")
                MetricItemView(
                    label: "Code Reviews", value: "\(metric.codeReviews)")
                MetricItemView(
                    label: "Merge Requests",
                    value: "\(metric.totalMergeRequests)")
            }

            HStack(spacing: 20) {
                MetricItemView(
                    label: "Team Contribution",
                    value: "\(metric.subjectiveTeamContribution)/10")
                MetricItemView(
                    label: "Discussions",
                    value: "\(metric.discussionThreadsContributedTo)")
            }

            if !metric.programmingLanguage.isEmpty {
                Text("Language: \(metric.programmingLanguage)")
                    .font(.caption)
                    .foregroundColor(.secondary)
            }

            if !metric.learnings.isEmpty {
                Text("Learnings: \(metric.learnings)")
                    .font(.caption)
                    .foregroundColor(.secondary)
            }
        }
        .padding(.vertical, 8)
    }

    // Format date for display
    private func formatDate(_ dateString: String) -> String {
        let inputFormatter = DateFormatter()
        inputFormatter.dateFormat = "dd/MM/yyyy"

        guard let date = inputFormatter.date(from: dateString) else {
            return dateString
        }

        let outputFormatter = DateFormatter()
        outputFormatter.dateStyle = .medium
        return outputFormatter.string(from: date)
    }
}

// Helper view for metric items
struct MetricItemView: View {
    let label: String
    let value: String

    var body: some View {
        VStack(alignment: .leading) {
            Text(label)
                .font(.caption)
                .foregroundColor(.secondary)
            Text(value)
                .font(.body)
                .fontWeight(.medium)
        }
    }
}

enum ChartTimeFrames: String, CaseIterable {
    case lastWeek
    case lastFortnight
    case lastMonth
    case lastYear
    case allTime

    var displayName: String {
        switch self {
        case .lastWeek: return "7 days"
        case .lastFortnight: return "14 days"
        case .lastMonth: return "Month"
        case .lastYear: return "Year"
        case .allTime: return "All Time"
        }
    }

    func data(for metricList: [Metric]) -> [Metric] {
        switch self {
        case .lastWeek: return Array(metricList.prefix(7)).reversed()
        case .lastFortnight: return Array(metricList.prefix(14)).reversed()
        case .lastMonth: return Array(metricList.prefix(30)).reversed()
        case .lastYear: return Array(metricList.prefix(365)).reversed()
        case .allTime: return metricList
        }
    }
}

// Enum for different chart metrics
enum ChartMetricType: String, CaseIterable {
    case timeSpentCoding
    case codeReviews
    case subjectiveTeamContribution
    case totalMergeRequests
    case discussionThreadsContributedTo

    var displayName: String {
        switch self {
        case .timeSpentCoding: return "Coding Time (min)"
        case .codeReviews: return "Code Reviews"
        case .subjectiveTeamContribution: return "Team Contribution"
        case .totalMergeRequests: return "Merge Requests"
        case .discussionThreadsContributedTo: return "Discussions"
        }
    }

    func value(for metric: Metric) -> Int {
        switch self {
        case .timeSpentCoding: return metric.timeSpentCoding
        case .codeReviews: return metric.codeReviews
        case .subjectiveTeamContribution:
            return metric.subjectiveTeamContribution
        case .totalMergeRequests: return metric.totalMergeRequests
        case .discussionThreadsContributedTo:
            return metric.discussionThreadsContributedTo
        }
    }

    func maxValue(in metrics: [Metric]) -> Int {
        let maxValue = metrics.map { value(for: $0) }.max() ?? 0
        return max(maxValue + 1, 10)  // Ensure we have some headroom in the chart
    }
}

// Preview provider
struct MetricsDashboard_Previews: PreviewProvider {
    static var previews: some View {
        MetricsDashboard()
    }
}
