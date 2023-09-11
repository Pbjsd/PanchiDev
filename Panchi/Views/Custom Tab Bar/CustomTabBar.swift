//
//  CustomTabBar.swift
//  Panchi
//
//  Created by Panchi on 9/11/23.
//

import SwiftUI

enum Tabs: Int {
  case newusers = 0
  case chats = 1
  case yourprofile = 2
}

struct CustomTabBar: View {

  @Binding var selectedTab: Tabs

  var body: some View {

    HStack (alignment: .center) {

      Button {

        // Switch to new users
        selectedTab = .newusers

      } label: {

        TabBarButton(buttonText: "New Users",
                     imageName: "dog.fill",
                     isActive: selectedTab == .newusers)

      }
      .tint(Color("icons-secondary"))

      Button {
        // Switch to chats
        selectedTab = .chats

      } label: {

        TabBarButton(buttonText: "Chats",
                     imageName: "message",
                     isActive: selectedTab == .chats)

        }
      .tint(Color("icons-secondary"))

        Button {
          // Switch to your profile
          selectedTab = .yourprofile

        } label: {

          TabBarButton(buttonText: "Profile",
                       imageName: "house",
                       isActive: selectedTab == .yourprofile)
        }
        .tint(Color("icons-secondary"))


      }
      .frame(height: 82)


    }
  }

  struct CustomTabBar_Previews: PreviewProvider {
    static var previews: some View {
      CustomTabBar(selectedTab: .constant(.yourprofile))
    }
  }
