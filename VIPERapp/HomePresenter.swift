//
//  HomePresenter.swift
//  VIPERapp
//
//  Created by beTech CAPITAL on 01/06/20.
//  Copyright © 2020 Ezequiel Barreto. All rights reserved.
//

import Foundation

class HomePresenter  {
    
    // MARK: Properties
    weak var view: HomeViewProtocol?
    var interactor: HomeInteractorInputProtocol?
    var router: HomeRouterProtocol?
    
}

extension HomePresenter: HomePresenterProtocol {
    // TODO: implement presenter methods
    func viewDidLoad() {
        interactor?.interactorGetData()
        view?.showActivity()
    }
    
    func showDetailView(with data: DatoURL){
        router?.presentNewViewDetail(from: view!, withData: data)
    }
}

extension HomePresenter: HomeInteractorOutputProtocol {
    func interactorPushDataPresenter(receivedData: [DatoURL]) {
        view?.stopAndHideActivity()
        view?.presenterPushDataView(receivedData: receivedData)
    }
}
