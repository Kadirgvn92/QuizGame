

import UIKit

class ViewController: UIViewController {
    
    
    @IBOutlet var lblScore: UILabel!
    @IBOutlet var lblQuestion: UILabel!
    @IBOutlet var btnChoose3: UIButton!
    @IBOutlet var btnChoose2: UIButton!
    @IBOutlet var btnChoose1: UIButton!
    @IBOutlet var progressBar: UIProgressView!
    
    var quizBrain = QuizBrain()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        designUI()
        
        updateUI()
    }
    
    
    @IBAction func btnTruePressed(_ sender: UIButton) {
        let userAnswer = sender.currentTitle!
        
        let userGetTrue = quizBrain.checkAnswer(userAnswer)
        
        if  userGetTrue {
            sender.backgroundColor = UIColor.systemGreen
        } else {
            sender.backgroundColor = UIColor.systemRed
        }
        
        quizBrain.nextQuestion()
        
        Timer.scheduledTimer(timeInterval: 0.2, target: self,
        selector : #selector(updateUI), userInfo: nil, repeats: false)
    }
    

    
    
    @objc func updateUI(){
        if quizBrain.getMessage() {
            showAlertWithScore()
        }
        
        lblQuestion.text = quizBrain.getQuestionText()
        progressBar.progress = quizBrain.getProgress()
        lblScore.text = "Score : \(quizBrain.getScore())"
        
        let choose = quizBrain.showChoose()

        // Butonlara seçenekleri yerleştir
        btnChoose1.setTitle(choose[0], for: .normal)
        btnChoose2.setTitle(choose[1], for: .normal)
        btnChoose3.setTitle(choose[2], for: .normal)
        
        
        btnChoose1.backgroundColor = UIColor.clear
        btnChoose2.backgroundColor = UIColor.clear
        btnChoose3.backgroundColor = UIColor.clear
        
    }
    
    func showAlertWithScore() {
        let alertController = UIAlertController(
            title: "Quiz Tamamlandı!",
            message: "Skorunuz: \(quizBrain.finalScore())",
            preferredStyle: .alert
        )

        let action = UIAlertAction(title: "Tamam", style: .default, handler: { _ in
            // Uyarı penceresi kapatıldığında yeni bir oyun başlatabilirsiniz.
            self.quizBrain.nextQuestion()
            self.updateUI()
        })

        alertController.addAction(action)

        present(alertController, animated: true, completion: nil)
    }
    
    
    func designUI () {
        progressBar.progress = 0
        btnChoose1.layer.borderWidth = 1
        btnChoose2.layer.borderWidth = 1
        btnChoose3.layer.borderWidth = 1
        btnChoose1.layer.borderColor = UIColor.black.cgColor
        btnChoose2.layer.borderColor = UIColor.black.cgColor
        btnChoose3.layer.borderColor = UIColor.black.cgColor
        btnChoose1.layer.cornerRadius = 25
        btnChoose2.layer.cornerRadius = 25
        btnChoose3.layer.cornerRadius = 25
    }
}

