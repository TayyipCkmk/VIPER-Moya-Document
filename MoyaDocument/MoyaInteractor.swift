//
//  MoyaInteractor.swift
//  MoyaDocument
//
//  Created by Tayyip Çakmak on 28.09.2021.
//
import Moya
import UIKit
import Foundation

protocol InteractorProtocol {
    var presenter: PresenterProtocol? { get set }
    
    func getUsers()
}

class MoyaInteractor: InteractorProtocol {
    var presenter: PresenterProtocol?
    let service = MoyaProvider<Users.usersTitle>()
    
    func getUsers() {
        service.request(.names) { (result) in
            
            switch result {
            case .success(let response):
                let users = try! JSONDecoder().decode([User].self, from: response.data)
                //self.users = users
                print(users)
                self.presenter?.interactorDidFetchUsers(with: .success(users))
            case .failure(let error):
                self.presenter?.interactorDidFetchUsers(with: .failure(error))
                print(error)
            }
        }
    }
}


