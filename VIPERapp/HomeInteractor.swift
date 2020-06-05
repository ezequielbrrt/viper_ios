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
    var arrayURL = [DatoURL]()
    
    func interactorGetData() {
        remoteDatamanager?.externalGetData()
    }
}

extension HomeInteractor: HomeRemoteDataManagerOutputProtocol {
    
    func remoteDataManagerCallBackData(with category: [CategoryURL]) {
        print("Estoy recibiendo estos datos \(category)")
        
        for url in category{
            let urlString = DatoURL(datoURL: url._links.selfito[0].href)
            arrayURL.append(urlString)
        }
        print("Le paso a presentar \(self.arrayURL)")
        
        presenter?.interactorPushDataPresenter(receivedData: self.arrayURL)
    }
    
}
