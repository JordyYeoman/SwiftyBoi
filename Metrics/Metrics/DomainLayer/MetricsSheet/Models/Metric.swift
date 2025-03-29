struct Metric: Codable {
    let date: String
    let codeReviews: Int
    let subjectiveTeamContribution: Int
    let totalMergeRequests: Int
    let learnings: String
    let timeSpentCoding: Int
    let discussionThreadsContributedTo: Int
    let courseTimeSpent: Int
    let programmingLanguage: String
    let linkToLearningResource: String

    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)

        date = try container.decode(String.self, forKey: .date)
        learnings = try container.decode(String.self, forKey: .learnings)
        programmingLanguage = try container.decode(
            String.self, forKey: .programmingLanguage)
        linkToLearningResource = try container.decode(
            String.self, forKey: .linkToLearningResource)

        // Convert string values to integers
        codeReviews =
            Int(try container.decode(String.self, forKey: .codeReviews)) ?? 0
        subjectiveTeamContribution =
            Int(
                try container.decode(
                    String.self, forKey: .subjectiveTeamContribution)) ?? 0
        totalMergeRequests =
            Int(try container.decode(String.self, forKey: .totalMergeRequests))
            ?? 0
        timeSpentCoding =
            Int(try container.decode(String.self, forKey: .timeSpentCoding))
            ?? 0
        discussionThreadsContributedTo =
            Int(
                try container.decode(
                    String.self, forKey: .discussionThreadsContributedTo)) ?? 0
        courseTimeSpent =
            Int(try container.decode(String.self, forKey: .courseTimeSpent))
            ?? 0
    }

    enum CodingKeys: String, CodingKey {
        case date
        case codeReviews
        case subjectiveTeamContribution
        case totalMergeRequests
        case learnings
        case timeSpentCoding
        case discussionThreadsContributedTo
        case courseTimeSpent
        case programmingLanguage
        case linkToLearningResource
    }
}
