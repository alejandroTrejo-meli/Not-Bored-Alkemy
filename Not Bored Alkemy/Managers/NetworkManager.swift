//
//  NetworkManager.swift
//  Not Bored Alkemy
//
//  Created by Alejandro Alejandro Trejo Rodriguez on 07/06/22.
//

import UIKit

class NetworkManager {
    
    static let shared = NetworkManager()
    
    func performRequest(with category: String, numOfPeople: Int?, price: Float, completion: @escaping (Result<Activity, RequestError>) -> ()) {
        
        
        let url = makeApiURL(category: category, numOfPeople: numOfPeople, price: price)
        let session = URLSession(configuration: .default)
        print("URL: \(url)")
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
                completion(.failure(.acitvityNotFound))
            }
            
        }
        task.resume()
    }
    
    public func makeApiURL(category: String, numOfPeople: Int?, price: Float) -> URL {
        let baseURL = "http://www.boredapi.com/api/activity"
        guard let numOfPeople = numOfPeople else {
            if category == "random" {
                return URL(string: baseURL + "?price=\(price)")!
            } else {
                return URL(string: baseURL + "?type=\(category)&price=\(price)")!
            }
        }
        
        if category == "random" {
            return URL(string: baseURL + "?participants=\(numOfPeople)&price=\(price)")!
        } else {
            return URL(string: baseURL + "?type=\(category)&participants=\(numOfPeople)&price=\(price)")!
        }
    }
    
}
