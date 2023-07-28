//
//  User.swift
//  Panchi
//
//  Created by Panchi on 7/12/23.
//

import Foundation
import FirebaseFirestoreSwift

struct User: Codable {

  @DocumentID var id: String?

  var firstname: String?

  var lastname: String?

  var phone: String?

  var photo: String?

}
