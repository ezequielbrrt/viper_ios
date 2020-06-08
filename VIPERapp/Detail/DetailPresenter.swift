//
//  DetailPresenter.swift
//  VIPERapp
//
//  Created by beTech CAPITAL on 05/06/20.
//  Copyright © 2020 Ezequiel Barreto. All rights reserved.
//

import Foundation

class DetailPresenter  {
    
    // MARK: Properties
    weak var view: DetailViewProtocol?
    var interactor: DetailInteractorInputProtocol?
    var router: DetailRouterProtocol?
    
    var datoURL: DatoURL?
    
    // TODO: implement presenter methods
    func viewDidLoad() {
        print("hola soy la vista detalle y tengo lo siguiente \(datoURL)")
        
        if let dato = datoURL{
            view?.showDataInLabel(data: dato)
        }
        
    }
    
}

extension DetailPresenter: DetailPresenterProtocol {
    
}

extension DetailPresenter: DetailInteractorOutputProtocol {
    // TODO: implement interactor output methods
}
