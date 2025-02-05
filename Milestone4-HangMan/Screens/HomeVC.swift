//
//  HomeVC.swift
//  Milestone4-HangMan
//
//  Created by Noah Pope on 2/5/25.
//

import UIKit

class HomeVC: UIViewController
{
    var scoreLabel: UILabel!
    var clueLabel: UILabel!
    var letterButtons       = [UIButton]()
    var activatedButtons    = [UIButton]()
    var solutions           = [String]()
    var answerSpaces        = [Character]()
    
    var level               = 1
    var correctAnswers      = 0
    var score               = 0 { didSet { scoreLabel.text = "Score: \(score)" } }
    
    
    override func loadView()
    {
        view                        = UIView()
        view.backgroundColor        = .systemPink
        
        createSubViews()
        addSubviews()
    }
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        
    }
    
    
    func createSubViews()
    {
        scoreLabel                  = UILabel()
        scoreLabel.textAlignment    = .right
        scoreLabel.text             = "Score: 0"
        scoreLabel.translatesAutoresizingMaskIntoConstraints = false
    }
    
    
    func addSubviews() { addSubviewz(scoreLabel, clueLabel) }
}

