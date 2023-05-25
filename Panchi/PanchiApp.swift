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
            ContentView()
          //In the CWC - they have this as RootView() but if you put that then you will get an error since you don't have a root view made yet 
        }
    }
}
