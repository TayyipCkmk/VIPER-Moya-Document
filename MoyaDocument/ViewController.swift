//
//  ViewController.swift
//  MoyaDocument
//
//  Created by Tayyip Çakmak on 28.09.2021.
//

import UIKit
import Foundation
protocol ViewProtocol: class {
    var presenter: PresenterProtocol? { get set }
    
    func update(with users: [User])
    func update(with error: String)
}

class ViewController: UIViewController, ViewProtocol, UITableViewDelegate, UITableViewDataSource {
    
    var presenter: PresenterProtocol?
    var users = [User]()
    
    private let tableView: UITableView = {
        let table = UITableView()
        table.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
        return table
    }()
    override func viewDidLoad() {
        //view.backgroundColor = .systemRed
        super.viewDidLoad()
        view.addSubview(tableView)
        tableView.delegate = self
        tableView.dataSource = self
        
    }
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        tableView.frame = view.bounds
    }
    func update(with error: String) {
        print(error)
    }
    func update(with users: [User]) {
        DispatchQueue.main.async {
            self.users = users
            self.tableView.reloadData()
        }
        
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return users.count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell")!
        cell.textLabel?.text = users[indexPath.row].name
        return cell
    }
}

