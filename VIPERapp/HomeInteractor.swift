//
//  HomeInteractor.swift
//  VIPERapp
//
//  Created by beTech CAPITAL on 01/06/20.
//  Copyright © 2020 Ezequiel Barreto. All rights reserved.
//

import Foundation

class HomeInteractor: HomeInteractorInputProtocol {
    
    // MARK: Properties
    weak var presenter: HomeInteractorOutputProtocol?
    var localDatamanager: HomeLocalDataManagerInputProtocol?
    var remoteDatamanager: HomeRemoteDataManagerInputProtocol?

    func interactorGetData() {
        remoteDatamanager?.externalGetData()
    }
}

extension HomeInteractor: HomeRemoteDataManagerOutputProtocol {
    
    func remoteDataManagerCallBackData(with category: [CategoryURL]) {
        
    }
}
