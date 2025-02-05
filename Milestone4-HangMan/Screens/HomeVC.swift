//
//  HomeVC.swift
//  Milestone4-HangMan
//
//  Created by Noah Pope on 2/5/25.
//

import UIKit

class HomeVC: UIViewController
{
    var currentSolution: String!
    { didSet { clueLabel.text = currentSolution ?? "testing" } }
    
    var scoreLabel: UILabel!
    var clueLabel: UILabel!
    var submitButton: UIButton!
    var clearButton: UIButton!
    var letterButtonsView: UIView!
    // handle population buttons in a for loop
    
    var activatedButtons    = [UIButton]()
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
    
    
    func addSubviews() { addSubviewz(scoreLabel, submitButton, clearButton, letterButtonsView) }
}

