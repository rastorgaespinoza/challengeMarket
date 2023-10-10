//
//  AttributeRemoteDTO.swift
//  Meli
//
//  Created by Rodrigo Astorga Espinoza on 09-10-23.
//

struct AttributeRemoteDTO: Codable {
  let id: String?
  let name: String?
  let valueID: String?
  let valueName: String?
  let attributeGroupID: String?
  let attributeGroupName: String?
  let source: Int?
  let valueType: String?

  enum CodingKeys: String, CodingKey {
    case id
    case name
    case valueID = "value_id"
    case valueName = "value_name"
    case attributeGroupID = "attribute_group_id"
    case attributeGroupName = "attribute_group_name"
    case source
    case valueType = "value_type"
  }
}
