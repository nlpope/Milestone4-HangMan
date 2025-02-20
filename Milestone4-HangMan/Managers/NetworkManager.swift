//
//  NetworkManager.swift
//  Milestone4-HangMan
//
//  Created by Noah Pope on 2/19/25.
//

import Foundation

class NetworkManager
{
    static let shared   = NetworkManager()
    
    private init() {}
    
    
    func fetchDictionary() -> Dictionary<String,String>
    {
        return [
            "cat dog":"the good boy that goes 'woof'",
            "hey whats going on":"hello",
            "ma ma":"yoyo",
            "moy":"berar jerry",
            "jingle":"bells",
            "rhythym and dance":"jump to the ..."
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
}
