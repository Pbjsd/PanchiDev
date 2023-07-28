//
//  TextHelper.swift
//  Panchi
//
//  Created by Panchi on 7/12/23.
//

import Foundation

class TextHelper {

  static func sanitizePhoneNumber(_ phone: String) -> String {

    return phone
      .replacingOccurrences(of: "(", with: "")
      .replacingOccurrences(of: ")", with: "")
      .replacingOccurrences(of: "-", with: "")
      .replacingOccurrences(of: " ", with: "")
  }

}
