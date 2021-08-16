//
//  NetworkManager.swift
//  ShibInuLover
//
//  Created by Ryan Matsuo on 8/13/21.
//

import Foundation

struct NetworkManager {
    
    static let shared = NetworkManager()
    
    func getShibuArray(from url: String, completed: @escaping ([String]?) -> Void) {
        guard let url = URL(string: url) else { return }
        
        let task = URLSession.shared.dataTask(with: url) { data, response, error in
            if error != nil { return }
            guard let data = data else { return }
            
            do {
                let array = try JSONSerialization.jsonObject(with: data) as! [String]
                completed(array)
            } catch {
                
            }
            
        }
        task.resume()
        
    }
    
    private init () {}
    
}
