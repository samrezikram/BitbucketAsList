//
//  NetworkManager.swift
//  BitbucketAsList
//
//  Created by Samrez Ikram on 03/07/2021.
//
import UIKit
import Alamofire
class NetworkManager: NSObject {
    
   
    class func getMostPopularNews( withCompletionHandler: @escaping (_ response:BitBucketRepository?)->(Void) ) {
      
        let headers: HTTPHeaders = [
            "Accept": "application/json",
            "Content-Type" :"application/json; charset=utf-8"
        ]
        let sourcesURL = URL(string: "https://api.bitbucket.org/2.0/repositories")!;

        AF.request( sourcesURL,
                          method: .get,
                          encoding: JSONEncoding.default,
                          headers: headers).responseJSON { (responseData) in
                            
                            if let data = responseData.data {
                                
                                let jsonDecoder = JSONDecoder()
                                let mostPopularNews = try! jsonDecoder.decode(BitBucketRepository.self, from: data)
                            
                                withCompletionHandler(mostPopularNews)
                            } else {
                                withCompletionHandler(nil)
                            }
            }
    }
    
    
    class func queryString(urlString:String, params:[String: Any]) -> String {
        
        let queryItems = params.map({ URLQueryItem(name: $0.key, value: $0.value as? String) })
        
        var urlComps = URLComponents(string: urlString)
        urlComps?.queryItems = queryItems
        
        return urlComps?.url?.absoluteString ?? ""
    }
    
    
   
    
}
