//
//  HomeVC.swift
//  Milestone4-HangMan
//
//  Created by Noah Pope on 2/5/25.
//

import UIKit

class HomeVC: UIViewController
{
    var answerClueDict              = [String:String]()
    var ACDictValues                = [String]()
    var currentAnswerKey: String!
    var currentClueValue: String!
    var encryptedAnswer: String!    = ""
    var encryptedAnswerArray        = [Character]()
    
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
    var numberOfLives       = LifeKey.maxLives { didSet { livesLabel.text = "Lives: \(numberOfLives)" } }
    
    
    //-------------------------------------//
    // MARK: METHODS
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
        if currentLevel >= 1 { score += 1 }
        if currentLevel > answerClueDict.count - 1 { currentLevel = 1 }
        else { currentLevel += 1 }
        
        numberOfLives       = LifeKey.maxLives
        currentClueValue    = ACDictValues[currentLevel - 1]
        currentAnswerKey    = answerClueDict.getKey(forValue: currentClueValue)?.uppercased()
        clueLabel.text      = currentClueValue
        encryptAnswer()
        resetKeyboard()
    }
    
    
    func encryptAnswer()
    {
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
    
    
    func deductLife()
    {
        numberOfLives -= 1
        if numberOfLives < 1 { presentGameOver(win: false) }
    }
    
    
    func resetKeyboard()
    {
        for i in 0..<usedLetterBtnsArray.count {
            usedLetterBtnsArray[i].isEnabled        = true
            usedLetterBtnsArray[i].backgroundColor  = .systemGray
        }
        usedLetterBtnsArray.removeAll(keepingCapacity: true)

    }
    
    
    func presentGameOver(win: Bool) {
        var ac      = UIAlertController()
        var action  = UIAlertAction()
        if !win {
            ac      = UIAlertController(title: "You Lose.", message: "Hit the btn below to try again.", preferredStyle: .alert)
            action  = UIAlertAction(title: "Reset", style: .default) { _ in self.resetLevel() }
        }
        else {
            ac      = UIAlertController(title: "You Won!", message: "Hit the btn below to load next level.", preferredStyle: .alert)
            action  = UIAlertAction(title: "Next Level", style: .default) { _ in self.loadNewLevel() }
        }
        
        ac.addAction(action)
        
        present(ac, animated: true)
    }
    
    //-------------------------------------//
    // MARK: OBJC METHODS
    @objc func resetLevel()
    {
        resetKeyboard()
        encryptAnswer()
        numberOfLives = LifeKey.maxLives
    }
    
    
    @objc func verifyLetter(_ sender: UIButton)
    {
        guard let selectedLetter = sender.titleLabel?.text
        else { return }
        sender.isEnabled = false
        usedLetterBtnsArray.append(sender)

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
            deductLife()
        }
        
        if answerField.text?.contains("?") == false { presentGameOver(win: true) }
    }
}
