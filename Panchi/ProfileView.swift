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

        Button {
        } label: {
          Image(systemName: "gearshape")
            .frame(width: 40, height: 40)
        }
   
      }
    }
}

struct ProfileView_Previews: PreviewProvider {
    static var previews: some View {
        ProfileView()
    }
}
