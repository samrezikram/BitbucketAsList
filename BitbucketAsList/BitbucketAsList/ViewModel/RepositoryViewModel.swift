//
//  RepositoryViewModel.swift
//  BitbucketAsList
//
//  Created by Samrez Ikram on 03/07/2021.



import Foundation
import ProgressHUD
class RepositoryViewModel : NSObject {
    
    private var apiService : APIService!
    private(set) var publicRepositories : BitBucketRepository! {
        didSet {
            self.bindnytNewsViewModelToController()
        }
    }
    
    var bindnytNewsViewModelToController : (() -> ()) = {}
    
    override init() {
        super.init()
        self.apiService =  APIService()
        callFuncToGetNYTNewsResults()
    }
    
    func callFuncToGetNYTNewsResults() {
        ProgressHUD.show()
        
        self.apiService.getPublicReposotories { (publicRepo) in
            self.publicRepositories = publicRepo
            ProgressHUD.dismiss()
        }
    }
}

