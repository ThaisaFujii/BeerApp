//
//  GenericService.swift
//  BeerChallenge
//
//  Created by Thaisa Fujii on 18/08/22.
//

import Foundation

protocol GenericService: AnyObject {
    typealias completion <T> = (_ result: T, _ failure: Error?) -> Void
}

enum Error: Swift.Error {
    case errorDescription(message: String, error: Swift.Error? = nil)
}
