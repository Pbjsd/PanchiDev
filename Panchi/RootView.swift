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

//      Text("Hello, Panchi!")
//        .padding()
//        .font(Font.chatHeading)

   //   Image(systemName: <#T##String#>)

      Spacer()
    }
    .fullScreenCover(isPresented: $isOnboarding) {
      // On dismiss
    } content: {
      // The onboarding sequence
      OnboardingContainerView(isOnboarding: $isOnboarding)
    }

    TabView {

      NewUsersView()
        .tabItem {
          Image(systemName: "dog.fill")
        }

      ChatView()
        .tabItem {
          Image(systemName: "message")
        }

      ProfileView()
        .tabItem {
          Image(systemName: "house")
        }

    }
  }

  }


  struct RootView_Previews: PreviewProvider {
    static var previews: some View {
      RootView()
    }
  }

