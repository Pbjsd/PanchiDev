//
//  PanchiApp.swift
//  Panchi
//
//  Created by Panchi on 5/24/23.
//

import SwiftUI

@main
struct PanchiApp: App {

  @UIApplicationDelegateAdaptor(AppDelegate.self) var appDelegate
  
    var body: some Scene {
        WindowGroup {
            RootView()
        }
    }
}
