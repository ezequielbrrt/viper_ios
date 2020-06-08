//
//  DetailView.swift
//  VIPERapp
//
//  Created by beTech CAPITAL on 05/06/20.
//  Copyright © 2020 Ezequiel Barreto. All rights reserved.
//

import Foundation
import UIKit

class DetailView: UIViewController {

    // MARK: Properties
    var presenter: DetailPresenterProtocol?

    // MARK: UIELEMENTS
    var labelTest: UILabel = {
        let label = UILabel()
        label.textAlignment = .center
        return label
    }()
    
    
    // MARK: Lifecycle

    override func viewDidLoad() {
        super.viewDidLoad()
        presenter?.viewDidLoad()
        
        setUpView()
        setLabelConstraints()
        
    }
    
    private func setLabelConstraints(){
        self.labelTest.translatesAutoresizingMaskIntoConstraints = false
        self.labelTest.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        self.labelTest.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
        
    }
    
    private func setUpView(){
        self.view.backgroundColor = .white
        self.view.addSubview(labelTest)
    }
}

extension DetailView: DetailViewProtocol {
    func showDataInLabel(data: DatoURL) {
        self.labelTest.text = data.datoURL
    }
}
