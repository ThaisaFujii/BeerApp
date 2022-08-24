//
//  BeerService.swift
//  BeerChallenge
//
//  Created by Thaisa Fujii on 17/08/22.
//

import Foundation

protocol BeerServiceProtocol: GenericService {
    func getData(from url: String, completion: @escaping completion<[BeerElement]?>)
}

class BeerService: BeerServiceProtocol {
    
    public func getData(from url: String, completion: @escaping completion<[BeerElement]?>){
        guard let url:URL = URL(string: url) else {
            return  completion(nil, Error.errorDescription(message: "URL error"))
        }
        
        var request = URLRequest(url: url)
        request.httpMethod = "GET"
        
        let task = URLSession.shared.dataTask(with: request, completionHandler: { data, response, error in
            guard let data = data, error == nil else {
                completion(nil, Error.errorDescription(message: "No data found", error: error))
                return
            }
            do {
               let result = try JSONDecoder().decode([BeerElement].self, from: data)
                completion(result, nil)
                print(result)
            }
            catch {
                completion(nil, Error.errorDescription(message: "Couldn't parse json", error: error))
            }
        })
        task.resume()
    }
}
