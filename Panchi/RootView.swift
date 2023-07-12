//
//  RootView.swift
//  Panchi
//
//  Created by Panchi on 5/24/23.
//

import SwiftUI

struct RootView: View {

  @State var isOnboarding = !AuthViewModel.isUserLoggedIn()

  var body: some View {

    VStack {

      Text("Hello, Panchi!")
        .padding()
        .font(Font.chatHeading)

      Spacer()
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

