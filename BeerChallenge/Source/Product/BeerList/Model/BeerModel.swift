//
//  BeerDetailModel.swift
//  BeerChallenge
//
//  Created by Thaisa Fujii on 19/08/22.
//

import Foundation

// MARK: - BeerElement
struct BeerElement: Codable {
    var id: Int
    var name, tagline, firstBrewed, beerDescription: String
    var imageURL: String
    var abv: Double
    var ibu: Double?
    var targetFg: Int
    var targetOg: Double
    var ebc: Int?
    var srm, ph: Double?
    var attenuationLevel: Double
    var volume, boilVolume: BoilVolume
    var method: Method
    var ingredients: Ingredients
    var foodPairing: [String]
    var brewersTips: String
    var contributedBy: ContributedBy

    enum CodingKeys: String, CodingKey {
        case id, name, tagline
        case firstBrewed = "first_brewed"
        case beerDescription = "description"
        case imageURL = "image_url"
        case abv, ibu
        case targetFg = "target_fg"
        case targetOg = "target_og"
        case ebc, srm, ph
        case attenuationLevel = "attenuation_level"
        case volume
        case boilVolume = "boil_volume"
        case method, ingredients
        case foodPairing = "food_pairing"
        case brewersTips = "brewers_tips"
        case contributedBy = "contributed_by"
    }
}

// MARK: - BoilVolume
struct BoilVolume: Codable {
    var value: Double
    var unit: Unit
}

enum Unit: String, Codable {
    case celsius = "celsius"
    case grams = "grams"
    case kilograms = "kilograms"
    case litres = "litres"
}

enum ContributedBy: String, Codable {
    case aliSkinnerAliSkinner = "Ali Skinner <AliSkinner>"
    case samMasonSamjbmason = "Sam Mason <samjbmason>"
}
// MARK: - Ingredients
struct Ingredients: Codable {
    var malt: [Malt]
    var hops: [Hop]
    var yeast: String
}

// MARK: - Hop
struct Hop: Codable {
    var name: String
    var amount: BoilVolume
    var add: Add
    var attribute: Attribute
}

enum Add: String, Codable {
    case dryHop = "dry hop"
    case end = "end"
    case middle = "middle"
    case start = "start"
}

enum Attribute: String, Codable {
    case aroma = "aroma"
    case attributeFlavour = "Flavour"
    case bitter = "bitter"
    case flavour = "flavour"
}

// MARK: - Malt
struct Malt: Codable {
    var name: String
    var amount: BoilVolume
}

// MARK: - Method
struct Method: Codable {
    var mashTemp: [MashTemp]
    var fermentation: Fermentation
    var twist: String?

    enum CodingKeys: String, CodingKey {
        case mashTemp = "mash_temp"
        case fermentation, twist
    }
}

// MARK: - Fermentation
struct Fermentation: Codable {
    var temp: BoilVolume
}

// MARK: - MashTemp
struct MashTemp: Codable {
    var temp: BoilVolume
    var duration: Int?
}

typealias Beer = [BeerElement]
