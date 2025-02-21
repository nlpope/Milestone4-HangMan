//
//  HomeVC.swift
//  Milestone4-HangMan
//
//  Created by Noah Pope on 2/5/25.
//

import UIKit

class HomeVC: UIViewController
{
    var answerClueDict      = [String:String]()
    var ACDictValues        = [String]()
    var currentAnswerKey: String!
    var currentClueValue: String!
    var encryptedAnswer: String! = ""
    var encryptedAnswerArray = [Character]()
    
    var currentLevelLabel: UILabel!
    var scoreLabel: UILabel!
    var livesLabel: UILabel!
    var clueLabel: UILabel!
    var answerField: UILabel!
    var letterButtonsVerticalStackView: UIStackView!
    
    var letterBtnsArray     = [UIButton]()
    var usedLetterBtnsArray = [UIButton]()
    var correctAnswers      = 0
    var currentLevel        = 0 { didSet { currentLevelLabel.text = "Level: \(currentLevel)" } }
    var score               = 0 { didSet { scoreLabel.text = "Score: \(score)" } }
    var numberOfLives       = 3 { didSet { livesLabel.text = "Lives: \(numberOfLives)" } }
    
    
    override func loadView()
    {
        configureView()
        configureSubViews()
    }
    
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        configureNavigation()
        fetchDictionary()
        loadNewLevel()
        layoutKeyboard()
    }
    
    
    private func fetchDictionary()
    {
        answerClueDict = NetworkManager.shared.fetchDictionary()
        ACDictValues  = answerClueDict.values.shuffled()
    }
    
    
    func loadNewLevel()
    {
        if currentLevel > answerClueDict.count - 1 { currentLevel = 1 }
        else { currentLevel += 1 }
        
        currentClueValue    = ACDictValues[currentLevel - 1]
        currentAnswerKey    = answerClueDict.getKey(forValue: currentClueValue)?.uppercased()
        clueLabel.text      = currentClueValue
        
        encryptedAnswer     = currentAnswerKey
        let patternsAndReplacements = [ ("[a-zA-Z]", "?") ]
       
        for (pattern, replacement) in patternsAndReplacements {
            encryptedAnswer = encryptedAnswer!.replacingOccurrences(of: pattern,
                                                                    with: replacement,
                                                                    options: .regularExpression)
        }
        
        answerField.text = encryptedAnswer
        encryptedAnswerArray = Array(encryptedAnswer)
    }
    
    
    func presentWinLoseAlert() {
        let ac = UIAlertController(title: "Incorrect", message: "Wrong answer. Please try again.", preferredStyle: .alert)
        let action = UIAlertAction(title: "Ok", style: .default)
        ac.addAction(action)
        
        present(ac, animated: true)
    }
    
    //XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX//
    // MARK: OBJC FUNCS
    @objc func resetLevel()
    {
        // reactivate btns
        // clear answer space
        // change nothing else
        loadNewLevel()
    }
    
    
    @objc func verifyLetter(_ sender: UIButton)
    {
        guard let selectedLetter = sender.titleLabel?.text
        else { return }
        sender.isEnabled = false

        if currentAnswerKey.contains(selectedLetter)
        {
            sender.backgroundColor      = .systemGreen
            let currentAnsArray         = Array(currentAnswerKey)
            
            for i in 0..<currentAnsArray.count {
                if String(currentAnsArray[i]) == selectedLetter {
                    encryptedAnswerArray[i] = Character(selectedLetter)
                }
            }
            answerField.text    = String(encryptedAnswerArray)
        }
        else
        {
            sender.backgroundColor  = .systemPink
        }
    }
}
