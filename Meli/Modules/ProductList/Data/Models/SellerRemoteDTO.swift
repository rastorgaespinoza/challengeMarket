//
//  SellerRemoteDTO.swift
//  Meli
//
//  Created by Rodrigo Astorga Espinoza on 09-10-23.
//

struct SellerRemoteDTO: Codable {
  let id: Int?
  let nickname: String?
  let carDealer: Bool?
  let realEstateAgency: Bool?
  let registrationDate: String?
  let tags: [String]?
  let carDealerLogo: String?
  let sellerReputation: SellerReputationRemoteDTO?

  enum CodingKeys: String, CodingKey {
    case id
    case nickname
    case carDealer = "car_dealer"
    case realEstateAgency = "real_estate_agency"
    case registrationDate = "registration_date"
    case tags
    case carDealerLogo = "car_dealer_logo"
    case sellerReputation = "seller_reputation"
  }
}

struct SellerReputationRemoteDTO: Codable {
  let levelID: String?
  let powerSellerStatus: String?
  let transactions: Transactions?
  let metrics: Metrics?

  enum CodingKeys: String, CodingKey {
    case levelID = "level_id"
    case powerSellerStatus = "power_seller_status"
    case transactions
    case metrics
  }
}

// MARK: - Metrics
struct Metrics: Codable {
  let sales: Sales?
  let claims: Cancellations?
  let delayedHandlingTime: Cancellations?
  let cancellations: Cancellations?

  enum CodingKeys: String, CodingKey {
    case sales
    case claims
    case delayedHandlingTime = "delayed_handling_time"
    case cancellations
  }
}

// MARK: - Cancellations
struct Cancellations: Codable {
  let period: String?
  let rate: Double?
  let value: Int?
}

// MARK: - Sales
struct Sales: Codable {
  let period: String?
  let completed: Int?
}

// MARK: - Transactions
struct Transactions: Codable {
  let canceled: Int?
  let completed: Int?
  let period: String?
  let ratings: Ratings?
  let total: Int?
}

// MARK: - Ratings
struct Ratings: Codable {
  let negative: Double?
  let neutral: Double?
  let positive: Double?
}
