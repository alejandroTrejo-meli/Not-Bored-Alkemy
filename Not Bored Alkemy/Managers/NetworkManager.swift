//
//  NetworkManager.swift
//  Not Bored Alkemy
//
//  Created by Alejandro Alejandro Trejo Rodriguez on 07/06/22.
//

import UIKit

class NetworkManager {
    
    static let shared = NetworkManager()

    
    func performRequest(with urlString: String, completion: @escaping (Result<Activity, RequestError>) -> ()) {
        guard let url = URL(string: urlString) else {
            completion(.failure(.invalidURL))
            return
        }
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
    
    
}
