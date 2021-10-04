//
//  MoyaPresenter.swift
//  MoyaDocument
//
//  Created by Tayyip Çakmak on 28.09.2021.
//

protocol PresenterProtocol {
    var routher: RouterProtocol? { get set }
    var interactor: InteractorProtocol? { get set }
    var view: ViewProtocol? { get set }
    
    func interactorDidFetchUsers(with result: Result<[User], Error>)
}

class MoyaPresenter: PresenterProtocol {
    var routher: RouterProtocol?
    
    var interactor: InteractorProtocol? {
        didSet {
            interactor?.getUsers()
        }
    }
    
    var view: ViewProtocol?

    func interactorDidFetchUsers(with result: Result<[User], Error>) {
        switch result {
        case .success(let users):
            view?.update(with: users)
        case .failure:
            view?.update(with: "Something is wrong")
        }
    }
}
