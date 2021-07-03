//
//  APIService.swift
//  BitbucketAsList
//
//  Created by Samrez Ikram on 03/07/2021.

import Foundation
class APIService :  NSObject {
    private let sourcesURL = URL(string: "https://api.bitbucket.org/2.0/repositories")!;
    
    func getPublicReposotories(completion : @escaping (BitBucketRepository) -> ()){
        
        URLSession.shared.dataTask(with: sourcesURL) { (data, urlResponse, error) in
            if let data = data {
                
                let jsonDecoder = JSONDecoder()
                
                let empData = try! jsonDecoder.decode(BitBucketRepository.self, from: data)
            
                    completion(empData)
            }
            
        }.resume()
    }
    
}
