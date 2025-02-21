//
//  HomeVC+Ext.swift
//  Milestone4-HangMan
//
//  Created by Noah Pope on 2/20/25.
//

import UIKit

extension HomeVC
{
    func configureView()
    {
        view                        = UIView()
        view.backgroundColor        = .systemBackground
    }
    
    
    func configureNavigation()
    {
        navigationItem.leftBarButtonItem = UIBarButtonItem(barButtonSystemItem: .refresh,
                                                           target: self,
                                                           action: #selector(resetLevel))
    }
    
    
    func configureSubViews()
    {
        currentLevelLabel                   = UILabel()
        currentLevelLabel.font              = UIFont.systemFont(ofSize: 25)
        currentLevelLabel.textAlignment     = .left
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
        clueLabel.text                      = "WHAAAAAAAAAAAA?"
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
    
    
    func layoutKeyboard()
    {
        letterButtonsVerticalStackView.axis             = .vertical
        letterButtonsVerticalStackView.distribution     = .fillEqually
        let lettersArray: [[String]]                    =
        [
            ["A", "B", "C", "D", "E", "F", "G", "H", "I", "J", "K", "L", "M"],
            ["N", "O", "P", "Q", "R", "S", "T", "U", "V", "W", "X", "Y", "Z"]
        ]
        
        for i in 0...1 {
            let horizontalStack            = UIStackView()
            horizontalStack.axis           = .horizontal
            horizontalStack.distribution   = .fillEqually
            
            for j in 0...12 {
                let letterBtn = UIButton()
                
                letterBtn.setTitle(lettersArray[i][j], for: .normal)
                letterBtn.titleLabel?.font = UIFont.systemFont(ofSize: 35)
                letterBtn.addTarget(self, action: #selector(verifyLetter(_:)), for: .touchUpInside)
                letterBtnsArray.append(letterBtn)
                horizontalStack.addArrangedSubview(letterBtn)
            }
            letterButtonsVerticalStackView.addArrangedSubview(horizontalStack)
        }
    }
}
