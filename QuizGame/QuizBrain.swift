

import Foundation

struct QuizBrain {
    

    let quiz = [
        Question(q: "Hangi gezegen Güneş Sistemi'ndeki en büyük gezegendir?",
            a: ["Mars", "Jüpiter", "Venüs"],
            correctAnswer: "Jüpiter"),
        Question(q: "Nobel Barış Ödülü, hangi ülkenin başkentinde dağıtılmaktadır?",
            a: ["İsveç", "Norveç", "Danimarka"],
            correctAnswer: "İsveç"),
        Question(q: "Hangi yıl Birinci Dünya Savaşı sona ermiştir?",
            a: ["1916", "1918", "1920"],
            correctAnswer: "1918"),
        Question(q: "\"İki Şehrin Hikayesi\" adlı romanın yazarı kimdir?",
            a: ["Charles Dickens", "Jane Austen", "Leo Tolstoy"],
            correctAnswer: "Charles Dickens"),
        Question(q: "Hangi yıl Türkiye Cumhuriyeti kurulmuştur?",
            a: ["1920", "1923", "1930"],
            correctAnswer: "1923"),
        Question(q: "Hangi elementin kimyasal sembolü \"O\" dur?",
            a: ["Oksijen", "Gümüş", "Altın"],
            correctAnswer: "Oksijen"),
        Question(q: "\"Ay Işığında\" adlı kitabın yazarı kimdir?",
            a: ["J.K. Rowling", "Harper Lee", "Neil Armstrong"],
            correctAnswer: "Neil Armstrong"),
        Question(q: "Hangi gezegen \"Kırmızı Gezegen\" olarak da bilinir?",
            a: ["Mars", "Venüs", "Jüpiter"],
            correctAnswer: "Mars"),
        Question(q: "\"Caz Kitabı\" adlı eseri ile ünlü olan yazar kimdir?",
            a: ["F. Scott Fitzgerald", "Jack Kerouac", "Toni Morrison"],
            correctAnswer: "F. Scott Fitzgerald"),
        Question(q: "Hangi yıl Google şirketi kurulmuştur?",
            a: ["1995", "2000", "1998"],
            correctAnswer: "1998"),
        Question(q: "Hangi gezegenin uydusu Titan, bilim adamları tarafından incelenmiştir?",
            a: ["Mars", "Jüpiter", "Satürn"],
            correctAnswer: "Satürn"),
        Question(q: "Türkiye'nin en yüksek dağı hangisidir?",
            a: ["Ağrı Dağı", "Toros Dağları", "Kaçkar Dağları"],
            correctAnswer: "Ağrı Dağı"),
        Question(q: "Hangi ülke Güney Amerika kıtasında yer almaz?",
            a: ["Brezilya", "Arjantin", "Cezayir"],
            correctAnswer: "Cezayir"),
        Question(q: "Hangi ünlü fizikçi, görelilik teorisini geliştirmiştir?",
            a: ["Isaac Newton", "Niels Bohr", "Albert Einstein"],
            correctAnswer: "Albert Einstein"),
        Question(q: "Hangi yıl Apollo 11, Ay'a ilk insanlı inişi gerçekleştirmiştir?",
            a: ["1967", "1969", "1972"],
            correctAnswer: "1969"),
        Question(q: "Hangi renk spektrumun en altında yer alır?",
            a: ["Kırmızı", "Mavi", "Yeşil"],
            correctAnswer: "Kırmızı")]
    
    var questionNumber = 0
    var chooseNumber = 0
    
    var score = 0
    
    func showChoose() -> [String] {
        return quiz[chooseNumber].choose
    }
    

    mutating func checkAnswer (_ userAnswer : String) -> Bool {
        if userAnswer == quiz[questionNumber].correctAnswer {
            score += 1
            return true
        } else {
            return false
        }
    }
    
    func getQuestionText() -> String{
        return quiz[questionNumber].text
    }
    
    func getProgress() -> Float{
        
        let progress = Float(questionNumber) / Float(quiz.count)
        return progress
    }
    
    mutating func nextQuestion(){
        if questionNumber + 1 < quiz.count  {
            questionNumber += 1
        } else {
            questionNumber = 0
            score = 0
        }

        if chooseNumber + 1 < quiz.count  {
            chooseNumber += 1
        } else {
            chooseNumber = 0
        }
    }
    
    func getScore() -> Int{
        return score
    }
    
    func getMessage() -> Bool{
        if questionNumber + 1 == quiz.count{
            return true
        } else {
            return false
        }
    }
    
    func finalScore() -> Int{
        if questionNumber + 1 == quiz.count {
            return score
        }
        return 0
    }
}
