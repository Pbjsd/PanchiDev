//
//  RootView.swift
//  Panchi
//
//  Created by Panchi on 5/24/23.
//

import SwiftUI

struct RootView: View {

  @State var selectedTab: Tabs = .newusers

  @State var isOnboarding = !AuthViewModel.isUserLoggedIn()

  var body: some View {

    ZStack {

      Color("background")
        .ignoresSafeArea()

      VStack {

        switch selectedTab {
        case .newusers:
          NewUsersView()
        case .chats:
          ChatView()
        case .yourprofile:
          ProfileView()
        }

        Spacer()

        CustomTabBar(selectedTab: $selectedTab)

      }
    }
    .fullScreenCover(isPresented: $isOnboarding) {
      // On dismiss
    } content: {
      // The onboarding sequence
      OnboardingContainerView(isOnboarding: $isOnboarding)
    }

  }

}


struct RootView_Previews: PreviewProvider {
  static var previews: some View {
    RootView()
  }
}

