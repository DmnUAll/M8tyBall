import Foundation

struct Answers {

    private let answersArray: [String] = [
        "Yes",
        "No",
        "Maybe",
        "Ask again later",
        "Get help",
        "Ask your mom",
        "I'll remember that",
        "42",
        "Not today, pal",
        "Mostly yes, than no",
        "Mostly no, than yes",
        "Throw a coin"
    ]
    var ballAnswer: String {
        guard let answer = answersArray.randomElement() else { return ""}
        return answer
    }
}
