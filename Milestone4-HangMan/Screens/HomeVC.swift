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
    var correctAnswer: String! { didSet { configureSubViews() } }
    
    var scoreLabel: UILabel!
    var clueLabel: UILabel!
    var answerSpacesView: UIView!
    var letterButtonsView: UIView!
    
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
        fillDictionary()
        loadLevel()
    }
    
    
    func configureNavigation()
    {
        navigationItem.leftBarButtonItem = UIBarButtonItem(barButtonSystemItem: .refresh, target: self, action: #selector(loadLevel))
    }
    
    
    func configureView()
    {
        view                        = UIView()
        view.backgroundColor        = .systemPink
    }
    
    func configureSubViews()
    {
        //XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX//
        // MARK: SCORE & CLUE LABEL SETUP
        scoreLabel                  = UILabel()
        scoreLabel.textAlignment    = .right
        scoreLabel.text             = "Score: 0"
        scoreLabel.translatesAutoresizingMaskIntoConstraints = false
        
        clueLabel                   = UILabel()
        clueLabel.font              = UIFont.systemFont(ofSize: 24)
        clueLabel.text              = "CLUE"
        clueLabel.numberOfLines     = 0
        clueLabel.translatesAutoresizingMaskIntoConstraints = false
        
        //XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX//
        // MARK: ANSWER SPACES VIEW & LETTER BUTTONS VIEW SETUP
        answerSpacesView.translatesAutoresizingMaskIntoConstraints = false
        
        addSubviewsExt(scoreLabel,
                    clueLabel,
                    answerSpacesView,
                    letterButtonsView)
        
        //XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX//
        // MARK: NSLAYOUT CONSTRAINTS
        NSLayoutConstraint.activate([
            scoreLabel.topAnchor.constraint(equalTo: view.layoutMarginsGuide.topAnchor),
            scoreLabel.trailingAnchor.constraint(equalTo: view.layoutMarginsGuide.trailingAnchor),
            
            // clue label
            clueLabel.topAnchor.constraint(equalTo: scoreLabel.bottomAnchor, constant: 200),
            clueLabel.leadingAnchor.constraint(equalTo: view.layoutMarginsGuide.leadingAnchor, constant: 100),
            clueLabel.widthAnchor.constraint(equalTo: view.layoutMarginsGuide.widthAnchor, multiplier: 0.6, constant: 0),
            
            //answer spaces
            answerSpacesView.topAnchor.constraint(equalTo: clueLabel.bottomAnchor, constant: 200),
            answerSpacesView.widthAnchor.constraint(equalTo: view.layoutMarginsGuide.widthAnchor),
            answerSpacesView.bottomAnchor.constraint(equalTo: letterButtonsView.topAnchor, constant: 200)
            
            // alph. buttons
            letterButtonsView.widthAnchor.constraint(equalTo: view.layoutMarginsGuide.widthAnchor, multiplier: 0.4),
            letterButtonsView.heightAnchor.constraint(equalToConstant: 320),
            letterButtonsView.centerXAnchor.constraint(equalTo: view.centerXAnchor)
        ])
    }
    
    
    func fillDictionary()
    {
        //        DispatchQueue.global(qos: .userInitiated).async {
        //            var clueString      = ""
        //            var solutionString  = ""
        //            var letterButtons   = [Character]()
        //
        //            if let levelFileURL = Bundle.main.url(forResource: "level\(self.level)", withExtension: "txt") {
        ////                if let levelContents = try? String
        //            }
        //        }
    }
    
    //XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX//
    // MARK: OBJC FUNCS
    @objc func loadLevel()
    {
        // reset (deselect) alphab. buttons
        // go to next item in dictionary
        // re-configure clue label answer space count
        self.clueLabel.text = "next item in dictionary"
    }
    
    
    @objc func letterTapped(_ sender: UIButton)
    {
        guard let buttonTitle   = sender.titleLabel?.text else { return }
        sender.isEnabled        = false
        // if current ans.contains buttontitle > fill in the space
        if correctAnswer.contains(buttonTitle) {
            // .ishidden is false on the answer field
        }
    }
    
    
    @objc func verifyAnswer(_ sender: UIButton)
    {
        guard let answerText                    = correctAnswer else { return }
        
        if let solutionPosition                 =
    }
    
    
    func presentWrongAnswerAlert() {
        let ac = UIAlertController(title: "Incorrect", message: "Wrong answer. Please try again.", preferredStyle: .alert)
        let action = UIAlertAction(title: "Ok", style: .default)
        ac.addAction(action)
        
        present(ac, animated: true)
    }
    
    
    @objc func clearButtonTapped()
    {
        
    }
    
    
    @objc func letterTapped()
    {
        
    }
}

