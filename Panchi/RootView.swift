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

//    HStack{
//
//      Spacer()
//      Button {
//      } label: {
//        Image(systemName: "message")
//      }
//Spacer()
//      Button {
//      } label: {
//        Image(systemName: "person")
//      }
//Spacer()
//      Button {
//      } label: {
//        Image(systemName: "house")
//      }
//      Spacer()
//    }

    TabView {

      NewUsersView()
        .tabItem {
          Image(systemName: "person")
        }

      ProfileView()
        .tabItem {
          Image(systemName: "house")
        }

      ChatView()
        .tabItem {
          Image(systemName: "message")
        }
    }
  }

  }


  struct RootView_Previews: PreviewProvider {
    static var previews: some View {
      RootView()
    }
  }

