//
//  APIService.swift
//
//  Created by Samrez Ikram on 02/05/21.
//  Copyright © 2020 Abhilash Mathur. All rights reserved.
//

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
