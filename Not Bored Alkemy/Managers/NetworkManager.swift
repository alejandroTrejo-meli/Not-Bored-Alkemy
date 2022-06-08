//
//  NetworkManager.swift
//  Not Bored Alkemy
//
//  Created by Alejandro Alejandro Trejo Rodriguez on 07/06/22.
//

import UIKit

class NetworkManager {
    
    static let shared = NetworkManager()
    
    func performRequest(with category: String, numOfPeople: Int?, completion: @escaping (Result<Activity, RequestError>) -> ()) {
        
        let url = makeApiURL(category: category, numOfPeople: numOfPeople)
        let session = URLSession(configuration: .default)
        
        let task = session.dataTask(with: url) { (data, response, error) in
            
            if let _ = error {
                completion(.failure(.unableToComplete))
            }
            
            guard let response = response as? HTTPURLResponse, response.statusCode == 200 else {
                completion(.failure(.unableToComplete))
                return
            }
            
            guard let data = data else {
                completion(.failure(.invalidData))
                return
            }
            
            do {
                let decodedActivity = try JSONDecoder().decode(Activity.self, from: data)
                DispatchQueue.main.async {
                    completion(.success(decodedActivity))
                }
            } catch {
                completion(.failure(.couldNotDecode))
                
            }
            
        }
        task.resume()
    }
    
    public func makeApiURL(category: String, numOfPeople: Int?) -> URL {
        guard let numOfPeople = numOfPeople else {
            if category == "random" {
                return URL(string: "http://www.boredapi.com/api/activity/")!
            } else {
                return URL(string: "http://www.boredapi.com/api/activity?type=\(category)")!
            }
        }
        
        if category == "random" {
            return URL(string: "http://www.boredapi.com/api/activity?participants=\(numOfPeople)")!
        } else {
            return URL(string: "http://www.boredapi.com/api/activity?type=\(category)&participants=\(numOfPeople)")!
        }
    }
    
    
    
    
    
    
}
