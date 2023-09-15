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

  @State var isChatShowing = false

  var body: some View {

    ZStack {

      Color("background")
        .ignoresSafeArea()

      VStack {

        switch selectedTab {

        case .newusers:
          NewUsersView()
        case .chats:
          ContactsListView()
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
    .fullScreenCover(isPresented: $isChatShowing, onDismiss: nil) {

      // The conversation view
      ConversationView()
    }
  }

}


struct RootView_Previews: PreviewProvider {
  static var previews: some View {
    RootView()
  }
}

