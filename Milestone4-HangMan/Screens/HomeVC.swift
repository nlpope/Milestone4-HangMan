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
    var currentAnswer: String! { didSet { configureSubViews() } }
    var currentClue: String!
    
    var scoreLabel: UILabel!
    var clueLabel: UILabel!
    var answerView: UIView!
    var letterButtonsView: UIView!
    var livesView: UIView!
    
    var activatedButtons    = [UIButton]()
    var level               = 1
    var correctAnswers      = 0
    var score               = 0 { didSet { scoreLabel.text = "Score: \(score)" } }
    
    
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
        loadLives()
        loadLevel()
    }
    
    
    func configureView()
    {
        view                        = UIView()
        view.backgroundColor        = .systemBackground
    }
    
    
    func configureSubViews()
    {
        scoreLabel                          = UILabel()
        scoreLabel.font                     = UIFont.systemFont(ofSize: 25)
        scoreLabel.textAlignment            = .right
        scoreLabel.text                     = "Score: 0"
        scoreLabel.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(scoreLabel)
        
        clueLabel                           = UILabel()
        clueLabel.backgroundColor           = .systemCyan
        clueLabel.font                      = UIFont.systemFont(ofSize: 45)
        clueLabel.text                      = "THIS GOOD BOY GOES 'WOOF'"
        clueLabel.textAlignment             = .center
        clueLabel.numberOfLines             = 0
        clueLabel.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(clueLabel)

        answerView                          = UIView()
        answerView.backgroundColor          = .systemBlue
        answerView.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(answerView)

        letterButtonsView                   = UIView()
        letterButtonsView.backgroundColor   = .systemPurple
        letterButtonsView.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(letterButtonsView)
        
        livesView                           = UIView()
        livesView.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(livesView)
        
        NSLayoutConstraint.activate([
            scoreLabel.topAnchor.constraint(equalTo: view.layoutMarginsGuide.topAnchor),
            scoreLabel.trailingAnchor.constraint(equalTo: view.layoutMarginsGuide.trailingAnchor),
            
            clueLabel.topAnchor.constraint(equalTo: scoreLabel.bottomAnchor, constant: 30),
            clueLabel.centerXAnchor.constraint(equalTo: view.layoutMarginsGuide.centerXAnchor),
            clueLabel.heightAnchor.constraint(equalToConstant: 150),
            clueLabel.widthAnchor.constraint(equalTo: view.layoutMarginsGuide.widthAnchor, multiplier: 0.8),
          
            answerView.topAnchor.constraint(equalTo: clueLabel.bottomAnchor, constant: 40),
            answerView.centerXAnchor.constraint(equalTo: view.layoutMarginsGuide.centerXAnchor),
            answerView.heightAnchor.constraint(equalToConstant: 100),
            answerView.widthAnchor.constraint(equalTo: view.layoutMarginsGuide.widthAnchor, multiplier: 0.8),


            letterButtonsView.topAnchor.constraint(equalTo: answerView.bottomAnchor, constant: 40),
            letterButtonsView.centerXAnchor.constraint(equalTo: view.layoutMarginsGuide.centerXAnchor),
            letterButtonsView.heightAnchor.constraint(equalToConstant: 200),
            letterButtonsView.widthAnchor.constraint(equalTo: view.layoutMarginsGuide.widthAnchor, multiplier: 0.8),

            livesView.topAnchor.constraint(equalTo: letterButtonsView.bottomAnchor, constant: 50),
            livesView.centerXAnchor.constraint(equalTo: view.layoutMarginsGuide.centerXAnchor),
            livesView.heightAnchor.constraint(equalToConstant: 45),
            livesView.widthAnchor.constraint(equalTo: view.layoutMarginsGuide.widthAnchor, multiplier: 0.3)
        ])
    }
    
    
    func configureNavigation()
    {
        navigationItem.leftBarButtonItem = UIBarButtonItem(barButtonSystemItem: .refresh, target: self, action: #selector(loadLevel))
    }
    
    
    func fetchDictionary()
    {
        answerClueDict  = [
            "dog":"the good boy that goes 'woofz'",
            "hey":"hello",
            "yo":"yoyo",
            "moy":"berar jerry",
            "jingle":"bells"
        ]
        
//        DispatchQueue.global(qos: .userInitiated).async {
//            var clueString      = ""
//            var solutionString  = ""
//            var letterButtons   = [Character]()
//
//            if let levelFileURL = Bundle.main.url(forResource: "words", withExtension: "txt") {
//            }
//        }
    }
    
    
    func loadLives(atX)
    {
//        let heartBox    = UIImageView(image: ImageKeys.pixelheart)
        let heartBox      = UIImageView(frame: CGRect(x: <#T##Int#>, y: <#T##Int#>, width: <#T##Int#>, height: <#T##Int#>))
        //sizeToFit()
    
    }
    
    
    func presentWrongAnswerAlert() {
        let ac = UIAlertController(title: "Incorrect", message: "Wrong answer. Please try again.", preferredStyle: .alert)
        let action = UIAlertAction(title: "Ok", style: .default)
        ac.addAction(action)
        
        present(ac, animated: true)
    }
    
    //XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX//
    // MARK: OBJC FUNCS
    @objc func loadLevel()
    {
        // reset (deselect) alphab. buttons
        // go to next item in dictionary
        
        currentClue     = answerClueDict.values.randomElement()
        currentAnswer   = answerClueDict.getKey(forValue: currentClue)
        clueLabel.text  = currentClue
        
        // re-configure answer space count
        
    }
    
    
    @objc func letterTapped(_ sender: UIButton)
    {
        guard let buttonTitle   = sender.titleLabel?.text else { return }
        sender.isEnabled        = false
        // if current ans.contains buttontitle > fill in the space
        if currentAnswer.contains(buttonTitle) {
            // .ishidden is false on the answer field
        }
    }
    
    
    @objc func verifyAnswer(_ sender: UIButton)
    {
        guard let answerText                    = currentAnswer else { return }
        
    }
    
    
    @objc func clearButtonTapped()
    {
        
    }
    
    
    @objc func letterTapped()
    {
        
    }
}

