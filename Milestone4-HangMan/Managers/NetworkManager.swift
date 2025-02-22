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
        var finalDict           = Dictionary<String,String>()

        DispatchQueue.global(qos: .userInteractive).sync
        {

            guard let gameFileURL   = Bundle.main.url(forResource: "words", withExtension: "txt")
            else { return }
            guard let gameContents  = try? String(contentsOf: gameFileURL, encoding: .ascii)
            else { return }
            
            let lines = gameContents.trimmingCharacters(in: .newlines).components(separatedBy: "\n")
            for line in lines
            {
                let parts   = line.components(separatedBy: ": ")
                let answer  = parts[0]
                let clue    = parts[1]
                
                finalDict[answer] = clue
            }
        }
        return finalDict
    }
}
