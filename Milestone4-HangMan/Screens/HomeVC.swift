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
    var currentAnswerKey: String! { didSet { configureSubViews() } }
    var currentClueValue: String!
    
    var levelLabel: UILabel!
    var scoreLabel: UILabel!
    var livesLabel: UILabel!
    var clueLabel: UILabel!
    var answerLabel: UILabel!
    var letterButtonsView: UIView!
    
    var lettersArray        = [String]()
    var letterBtnsArray     = [UIButton]()
    var usedLetterBtnsArray = [UIButton]()
    var correctAnswers      = 0
    var currentLevel        = 0 { didSet { levelLabel.text = "Level: \(currentLevel)" } }
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
    }
    
    
    func configureView()
    {
        view                        = UIView()
        view.backgroundColor        = .systemBackground
    }
    
    
    func configureSubViews()
    {
        levelLabel                          = UILabel()
        levelLabel.font                     = UIFont.systemFont(ofSize: 25)
        levelLabel.textAlignment            = .left
        levelLabel.text                     = "Level: \(currentLevel)"
        levelLabel.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(levelLabel)
        
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

        answerLabel                         = UILabel()
        answerLabel.backgroundColor         = .systemBlue
        answerLabel.font                    = UIFont.systemFont(ofSize: 45)
        answerLabel.text                    = "?"
        answerLabel.textAlignment           = .center
        answerLabel.numberOfLines           = 0
        answerLabel.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(answerLabel)

        letterButtonsView                   = UIView()
        letterButtonsView.backgroundColor   = .systemPurple
        letterButtonsView.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(letterButtonsView)
        
        NSLayoutConstraint.activate([
            levelLabel.topAnchor.constraint(equalTo: view.layoutMarginsGuide.topAnchor),
            levelLabel.leadingAnchor.constraint(equalTo: view.layoutMarginsGuide.leadingAnchor),
            
            scoreLabel.topAnchor.constraint(equalTo: view.layoutMarginsGuide.topAnchor),
            scoreLabel.trailingAnchor.constraint(equalTo: view.layoutMarginsGuide.trailingAnchor),
            
            livesLabel.topAnchor.constraint(equalTo: scoreLabel.bottomAnchor, constant: 20),
            livesLabel.trailingAnchor.constraint(equalTo: view.layoutMarginsGuide.trailingAnchor),
            
            clueLabel.topAnchor.constraint(equalTo: livesLabel.bottomAnchor, constant: 30),
            clueLabel.centerXAnchor.constraint(equalTo: view.layoutMarginsGuide.centerXAnchor),
            clueLabel.heightAnchor.constraint(equalToConstant: 150),
            clueLabel.widthAnchor.constraint(equalTo: view.layoutMarginsGuide.widthAnchor, multiplier: 0.8),
          
            answerLabel.topAnchor.constraint(equalTo: clueLabel.bottomAnchor, constant: 40),
            answerLabel.centerXAnchor.constraint(equalTo: view.layoutMarginsGuide.centerXAnchor),
            answerLabel.heightAnchor.constraint(equalToConstant: 100),
            answerLabel.widthAnchor.constraint(equalTo: view.layoutMarginsGuide.widthAnchor, multiplier: 0.8),


            letterButtonsView.topAnchor.constraint(equalTo: answerLabel.bottomAnchor, constant: 40),
            letterButtonsView.centerXAnchor.constraint(equalTo: view.layoutMarginsGuide.centerXAnchor),
            letterButtonsView.heightAnchor.constraint(equalToConstant: 200),
            letterButtonsView.widthAnchor.constraint(equalTo: view.layoutMarginsGuide.widthAnchor, multiplier: 0.8)
        ])
    }
    
    
    func configureNavigation()
    {
//        navigationItem.leftBarButtonItem = UIBarButtonItem(barButtonSystemItem: .refresh, target: self, action: #selector(resetLevel))
        navigationItem.leftBarButtonItem = UIBarButtonItem(barButtonSystemItem: .refresh, target: self, action: #selector(loadNewLevel))
    }
    
    
    func fetchDictionary()
    {
        answerClueDict      = [
            "dog":"the good boy that goes 'woofz'",
            "hey":"hello",
            "ma":"yoyo",
            "moy":"berar jerry",
            "jingle":"bells"
        ]
        ACDictValues  = answerClueDict.values.shuffled()

        print("anscludictcount = \(answerClueDict.count)")
        
//        DispatchQueue.global(qos: .userInitiated).async {
//            var clueString      = ""
//            var solutionString  = ""
//            var letterButtons   = [Character]()
//
//            if let levelFileURL = Bundle.main.url(forResource: "words", withExtension: "txt") {
//            }
//        }
    }
    
    
    #warning("remove @objc after testing")
    @objc func loadNewLevel()
    {
        if currentLevel >= answerClueDict.count { currentLevel = 1 }
        else { currentLevel += 1 }
        
        currentClueValue    = ACDictValues[currentLevel]
        currentAnswerKey    = answerClueDict.getKey(forValue: currentClueValue)
        clueLabel.text      = currentClueValue
        
        var ansTxt      = ""
        for _ in 1...currentAnswerKey.count {
            ansTxt.append("?")
        }
        
        answerLabel.text    = ansTxt
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

