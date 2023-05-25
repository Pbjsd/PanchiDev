//
//  AppDelegate.swift
//  Panchi
//
//  Created by Panchi on 5/24/23.
//

import Foundation
import UIKit
import Firebase

class AppDelegate: UIResponder, UIApplicationDelegate {

  func application(_ application: UIApplication,
                   didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey : Any]? = nil) -> Bool {
    FirebaseApp.configure()

    return true
  }
}
