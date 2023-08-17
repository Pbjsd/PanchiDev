//
//  ProfileCompletionView.swift
//  Panchi
//
//  Created by Panchi on 8/17/23.
//

import SwiftUI

struct ProfileCompletionView: View {

  @Binding var isOnboarding: Bool

    var body: some View {

      VStack {
        Spacer()

        //Image("onboarding-all-set")
        // you haven't added the images yet

        Text("Awesome!")
          .font(Font.titleText)
          .padding(.top, 32)

        Text("Continue to start chatting with your friends.")
          .font(Font.bodyParagraph)
          .padding(.top, 8)

        Spacer()

        Button {
          // End onboarding
          isOnboarding = false

        } label: {

          Text("Continue")
        }
        .buttonStyle(OnboardingButtonStyle())
        .padding(.bottom, 87)

      }
      .padding(.horizontal)
    }
}

struct ProfileCompletionView_Previews: PreviewProvider {
    static var previews: some View {
      ProfileCompletionView(isOnboarding: .constant(true))
    }
}
