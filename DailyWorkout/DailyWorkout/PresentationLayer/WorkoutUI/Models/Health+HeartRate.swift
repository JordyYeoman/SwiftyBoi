import Foundation

struct HeartRate: Identifiable {
    let id: UUID
    let day: Date
    let rate: Int
    
    init(day: Date, rate: Int) {
        self.day = day
        self.rate = rate
        self.id = UUID()
    }
}

extension HeartRate {
    static var exampleData: [HeartRate] {
        // Create a date formatter for creating dates
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd"

        // Define start and end dates
        let startDate = dateFormatter.date(from: "2025-01-01")!
        let endDate = dateFormatter.date(from: "2025-03-09")!

        // Create calendar for date manipulation
        let calendar = Calendar.current

        // Generate dates from start to end
        var currentDate = startDate
        var heartRates: [HeartRate] = []

        // Random number generator for realistic heart rates
        let randomHeartRateGenerator = { () -> Int in
            // Generate heart rates between 60-100 BPM for example data
            return Int.random(in: 60...100)
        }

        // Loop through each day
        while currentDate <= endDate {
            heartRates.append(
                HeartRate(
                    day: currentDate,
                    rate: randomHeartRateGenerator()
                ))

            // Move to next day
            currentDate = calendar.date(
                byAdding: .day, value: 1, to: currentDate)!
        }

        return heartRates
    }
}
