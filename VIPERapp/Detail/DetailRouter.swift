//
//  DetailRouter.swift
//  VIPERapp
//
//  Created by beTech CAPITAL on 05/06/20.
//  Copyright © 2020 Ezequiel Barreto. All rights reserved.
//

import Foundation
import UIKit

class DetailRouter: DetailRouterProtocol {

    class func createDetailModule(with data: DatoURL) -> UIViewController {
        
        let view = DetailView()
        let presenter: DetailPresenterProtocol & DetailInteractorOutputProtocol = DetailPresenter()
        let interactor: DetailInteractorInputProtocol & DetailRemoteDataManagerOutputProtocol = DetailInteractor()
        let localDataManager: DetailLocalDataManagerInputProtocol = DetailLocalDataManager()
        let remoteDataManager: DetailRemoteDataManagerInputProtocol = DetailRemoteDataManager()
        let router: DetailRouterProtocol = DetailRouter()
        
        view.presenter = presenter
        presenter.view = view
        presenter.router = router
        presenter.interactor = interactor
        presenter.datoURL = data
        interactor.presenter = presenter
        interactor.localDatamanager = localDataManager
        interactor.remoteDatamanager = remoteDataManager
        remoteDataManager.remoteRequestHandler = interactor
        

        return view
        
    }
    
}
