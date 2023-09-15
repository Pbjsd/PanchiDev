//
//  ProfileView.swift
//  Panchi
//
//  Created by Panchi on 9/1/23.
//

import SwiftUI

struct ProfileView: View {

    var body: some View {

      ZStack(alignment: .topTrailing) {
        Color.white.edgesIgnoringSafeArea(.all)

        // TODO: this is not the permanent place for the logout button. I currently have the settings button as the logout button

          Button {
            AuthViewModel.logout()
          } label: {
            Image(systemName: "gearshape.fill")
              .frame(width: 50, height: 50)
              .tint(Color("icons-secondary"))
          }

        }
      }
}

struct ProfileView_Previews: PreviewProvider {
    static var previews: some View {
        ProfileView()
    }
}
