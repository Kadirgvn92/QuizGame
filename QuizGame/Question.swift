
struct Question {
    var text : String
    var choose : [String]
    var correctAnswer : String
    
    init(q: String, a: [String] , correctAnswer: String) {
        text = q
        choose = a
        self.correctAnswer = correctAnswer
    }
}
