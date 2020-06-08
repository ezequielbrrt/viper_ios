//
//  HomeView.swift
//  VIPERapp
//
//  Created by beTech CAPITAL on 01/06/20.
//  Copyright © 2020 Ezequiel Barreto. All rights reserved.
//

import Foundation
import UIKit

class HomeView: UIViewController {

    // MARK: Properties
    var presenter: HomePresenterProtocol?
    var arrayViewURL = [DatoURL]()
    
    // MARK: UIELEMENTS
    var testLabel: UILabel = {
        let label = UILabel()
        label.text = "Mi primer app en viper"
        return label
    }()
    
    var tableView: UITableView = {
        let tableView = UITableView()
        return tableView
    }()
    
    var loader: UIActivityIndicatorView = {
        let loader = UIActivityIndicatorView()
        loader.color = .blue
        loader.style = .large
        return loader
    }()
    
    // MARK: Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        self.presenter?.viewDidLoad()
        
        createView()
        createConstraints()
    }
    
    private func createConstraints(){
        // setLabelConstraints()
        setTableViewConstraints()
        setLoaderConstraints()
    }
    
    private func setLoaderConstraints(){
        loader.translatesAutoresizingMaskIntoConstraints = false
        loader.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        loader.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
    }
    
    private func setTableViewConstraints(){
        // MARK: TABLE VIEW CONSTRAINTS
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
        tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
        tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
        tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
    }
    
    private func setLabelConstraints(){
        // MARK: LABEL CONSTRAINTS
        testLabel.translatesAutoresizingMaskIntoConstraints = false
        testLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        testLabel.topAnchor.constraint(equalTo: view.topAnchor, constant: 150).isActive = true
    }
    
    private func createView(){
        self.view.backgroundColor = .white
        //view.addSubview(testLabel)
        view.addSubview(tableView)
        view.addSubview(loader)
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
        tableView.delegate = self
        tableView.dataSource = self
    }
}

extension HomeView: HomeViewProtocol {
    
    func presenterPushDataView(receivedData: [DatoURL]) {
        DispatchQueue.main.async {
            self.arrayViewURL = receivedData
            self.tableView.reloadData()
        }
        
    }
    
    func showActivity() {
        DispatchQueue.main.async {
            self.loader.startAnimating()
        }
    }
    
    func stopAndHideActivity() {
        DispatchQueue.main.async {
            self.loader.hidesWhenStopped = true
            self.loader.stopAnimating()
        }
    }
    
}

extension HomeView: UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.arrayViewURL.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        
        cell.textLabel?.text = arrayViewURL[indexPath.row].datoURL
        
        return cell
    }
    
    
}

extension HomeView: UITableViewDelegate{
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        presenter?.showDetailView(with: arrayViewURL[indexPath.row])
    }
}
