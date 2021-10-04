//
//  MoyaRouter.swift
//  MoyaDocument
//
//  Created by Tayyip Çakmak on 28.09.2021.
//
import Foundation
import UIKit

typealias EntryPoint = ViewProtocol & UIViewController

protocol RouterProtocol {
    var entry: EntryPoint? { get }
    
    static func start() -> RouterProtocol
}

class MoyaRouter: RouterProtocol {
    var entry: EntryPoint?
    
    static func start() -> RouterProtocol {
        let routher = MoyaRouter()
        let view: ViewProtocol = ViewController()
        var presenter: PresenterProtocol = MoyaPresenter()
        var interactor: InteractorProtocol = MoyaInteractor()
        
        view.presenter = presenter
        interactor.presenter = presenter
        
        presenter.routher = routher
        presenter.view = view
        presenter.interactor = interactor
        
        routher.entry = view as? EntryPoint
        return routher
    }
}


