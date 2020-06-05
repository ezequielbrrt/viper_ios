//
//  HomeRemoteDataManager.swift
//  VIPERapp
//
//  Created by beTech CAPITAL on 01/06/20.
//  Copyright © 2020 Ezequiel Barreto. All rights reserved.
//

import Foundation

class HomeRemoteDataManager:HomeRemoteDataManagerInputProtocol {
    
    var remoteRequestHandler: HomeRemoteDataManagerOutputProtocol?
    var getURL = [CategoryURL]()
    
    func externalGetData() {
        let session = URLSession.shared
        var request = URLRequest(url: URL(string: "https://cfeapps.com/wp-json/wp/v2/categories")!)
        request.httpMethod = "GET"
        request.setValue("application/json; charset=utf8", forHTTPHeaderField: "Content-Type")
        
        session.dataTask(with: request){ (data, response, error) in
            guard let data = data, error == nil, let respuesta = response as? HTTPURLResponse else{
                print("Ha ocurrido un error")
                return
            }
            
            if respuesta.statusCode == 200{
                do{
                    let decoder = JSONDecoder()
                    self.getURL = try decoder.decode([CategoryURL].self, from: data)
                    
                    self.remoteRequestHandler?.remoteDataManagerCallBackData(with: self.getURL)
                } catch{
                    print("No se pudo parsear el archivo")
                }
            }else{
                print("ha ocurrido un error: \(error?.localizedDescription)")
            }
            
            
        }.resume()
    }
}
