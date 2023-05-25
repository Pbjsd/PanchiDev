//
//  AuthViewModel.swift
//  Panchi
//
//  Created by Panchi on 5/25/23.
//

import Foundation
import FirebaseAuth

class AuthViewModel {

  static func isUserLoggedIn() -> Bool {
    return Auth.auth().currentUser != nil
  }

  static func getLoggedInUserId() -> String {
      return Auth.auth().currentUser?.uid ?? ""
  }

  static func logout() {
      try? Auth.auth().signOut()
  }
}
