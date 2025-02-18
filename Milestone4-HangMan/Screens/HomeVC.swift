//
//  HomeVC.swift
//  Milestone4-HangMan
//
//  Created by Noah Pope on 2/5/25.
//

import UIKit

class HomeVC: UIViewController
{
    var answerClueDict      = [ String:String ]()
    var ACDictValues  = [String]()
    var currentAnswerKey: String!
    var currentClueValue: String!
    
    var currentLevelLabel: UILabel!
    var scoreLabel: UILabel!
    var livesLabel: UILabel!
    var clueLabel: UILabel!
    var answerField: UILabel!
    var letterButtonsVerticalStackView: UIStackView!
    
    var lettersArray        = [String]()
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
    
    
    func configureView()
    {
        view                        = UIView()
        view.backgroundColor        = .systemBackground
    }
    
    
    func configureSubViews()
    {
        currentLevelLabel                          = UILabel()
        currentLevelLabel.font                     = UIFont.systemFont(ofSize: 25)
        currentLevelLabel.textAlignment            = .left
        currentLevelLabel.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(currentLevelLabel)
        
        scoreLabel                          = UILabel()
        scoreLabel.font                     = UIFont.systemFont(ofSize: 25)
        scoreLabel.textAlignment            = .right
        scoreLabel.text                     = "Score: 0"
        scoreLabel.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(scoreLabel)
        
        livesLabel                          = UILabel()
        livesLabel.font                     = UIFont.systemFont(ofSize: 25)
        livesLabel.textAlignment            = .right
        livesLabel.text                     = "Lives: \(numberOfLives)"
        livesLabel.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(livesLabel)
        
        clueLabel                           = UILabel()
        clueLabel.backgroundColor           = .systemCyan
        clueLabel.font                      = UIFont.systemFont(ofSize: 45)
        clueLabel.text                      = "THIS GOOD BOY GOES 'WOOF'"
        clueLabel.textAlignment             = .center
        clueLabel.numberOfLines             = 0
        clueLabel.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(clueLabel)

        answerField                         = UILabel()
        answerField.backgroundColor         = .systemBlue
        answerField.font                    = UIFont.systemFont(ofSize: 45)
        answerField.textAlignment           = .center
        answerField.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(answerField)

        letterButtonsVerticalStackView                   = UIStackView()
        letterButtonsVerticalStackView.backgroundColor   = .systemPurple
        letterButtonsVerticalStackView.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(letterButtonsVerticalStackView)
        
        NSLayoutConstraint.activate([
            currentLevelLabel.topAnchor.constraint(equalTo: view.layoutMarginsGuide.topAnchor),
            currentLevelLabel.leadingAnchor.constraint(equalTo: view.layoutMarginsGuide.leadingAnchor),
            
            scoreLabel.topAnchor.constraint(equalTo: view.layoutMarginsGuide.topAnchor),
            scoreLabel.trailingAnchor.constraint(equalTo: view.layoutMarginsGuide.trailingAnchor),
            
            livesLabel.topAnchor.constraint(equalTo: scoreLabel.bottomAnchor, constant: 20),
            livesLabel.trailingAnchor.constraint(equalTo: view.layoutMarginsGuide.trailingAnchor),
            
            clueLabel.topAnchor.constraint(equalTo: livesLabel.bottomAnchor, constant: 30),
            clueLabel.centerXAnchor.constraint(equalTo: view.layoutMarginsGuide.centerXAnchor),
            clueLabel.heightAnchor.constraint(equalToConstant: 150),
            clueLabel.widthAnchor.constraint(equalTo: view.layoutMarginsGuide.widthAnchor, multiplier: 0.8),
          
            answerField.topAnchor.constraint(equalTo: clueLabel.bottomAnchor, constant: 40),
            answerField.centerXAnchor.constraint(equalTo: view.layoutMarginsGuide.centerXAnchor),
            answerField.heightAnchor.constraint(equalToConstant: 100),
            answerField.widthAnchor.constraint(equalTo: view.layoutMarginsGuide.widthAnchor, multiplier: 0.8),


            letterButtonsVerticalStackView.topAnchor.constraint(equalTo: answerField.bottomAnchor, constant: 40),
            letterButtonsVerticalStackView.centerXAnchor.constraint(equalTo: view.layoutMarginsGuide.centerXAnchor),
            letterButtonsVerticalStackView.heightAnchor.constraint(equalToConstant: 200),
            letterButtonsVerticalStackView.widthAnchor.constraint(equalTo: view.layoutMarginsGuide.widthAnchor, multiplier: 0.8)
        ])
    }
    
    
    func configureNavigation()
    {
        navigationItem.leftBarButtonItem = UIBarButtonItem(barButtonSystemItem: .refresh,
                                                           target: self,
                                                           action: #selector(resetLevel))
    }
    
    
    func fetchDictionary()
    {
        answerClueDict      = [
            "dog":"the good boy that goes 'woofz'",
            "hey":"hello",
            "ma":"yoyo",
            "moy":"berar jerry",
            "jingle":"bells",
            "rhythym":"move to the ..."
        ]
        ACDictValues  = answerClueDict.values.shuffled()
        
//        DispatchQueue.global(qos: .userInitiated).async {
//            var clueString      = ""
//            var solutionString  = ""
//            var letterButtons   = [Character]()
//
//            if let levelFileURL = Bundle.main.url(forResource: "words", withExtension: "txt") {
//            }
//        }
    }
    
    
    func loadNewLevel()
    {
        if currentLevel > answerClueDict.count - 1 { currentLevel = 1 }
        else { currentLevel += 1 }
        
        currentClueValue    = ACDictValues[currentLevel - 1]
        currentAnswerKey    = answerClueDict.getKey(forValue: currentClueValue)
        clueLabel.text      = currentClueValue
        
        var ansTxt      = ""
        for _ in 1...currentAnswerKey.count {
            ansTxt.append("?")
        }
        
        answerField.text    = ansTxt
    }
    
    
    func layoutKeyboard()
    {
        letterButtonsVerticalStackView.axis          = .vertical
        letterButtonsVerticalStackView.distribution  = .fillEqually
        
        for i in 1...3 {
            let horizontalStack            = UIStackView()
            horizontalStack.axis           = .horizontal
            horizontalStack.distribution   = .fillEqually
            
            for _ in 1...12 {
                let letterBtn = UIButton()
                letterBtn.setTitle("Z", for: .normal)
                letterBtnsArray.append(letterBtn)
                horizontalStack.addArrangedSubview(letterBtn)
            }
            letterButtonsVerticalStackView.addArrangedSubview(horizontalStack)
        }
    }
    
    
    func presentWrongAnswerAlert() {
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
        print("resetting level")
    }
    
    
    @objc func letterTapped(_ sender: UIButton)
    {
        guard let buttonTitle   = sender.titleLabel?.text else { return }
        sender.isEnabled        = false
        // if current ans.contains buttontitle > fill in the space
        if currentAnswerKey.contains(buttonTitle) {
            // .ishidden is false on the answer field
        }
    }
    
    
    @objc func verifyAnswer(_ sender: UIButton)
    {
        // for letters in currentanswer, check each '?' & replace w the sender's text if it exists in that space
        guard let answerText    = currentAnswerKey else { return }
    }
}


extension HomeVC: UITextFieldDelegate
{
   
}

