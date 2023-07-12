//
//  CreateProfileView.swift
//  Panchi
//
//  Created by Panchi on 5/27/23.
//

import SwiftUI

struct CreateProfileView: View {

  //adding this here since this will be the last step of the onboading process and not SyncContactsView - orig this was supposed to be on the SyncContactsView but since we are not syncing contacts anymore, we are putting this here

  @Binding var currentStep: OnboardingStep

  @Binding var isOnboarding: Bool

  @State var firstName = ""
  @State var lastName = ""

  var body: some View {

    VStack {

      Text("Setup your Profile")
        .font(Font.titleText)
        .padding(.top, 52)

      Text("Just a few more details to get started")
        .font(Font.bodyParagraph)
        .padding(.top, 12)

      Spacer()

      // Profile image button
      Button {

        // Show action sheet

      } label: {

        ZStack {

          Circle()
            .foregroundColor(Color.white)

          Circle()
            .stroke(Color("create-profile-border"), lineWidth: 2)

          Image(systemName: "camera.fill")
            .tint(Color("icons-input"))

        }
        .frame(width: 134, height: 134)

      }

      Spacer()

      // First name
      TextField("Given Name", text: $firstName)
        .textFieldStyle(CreateProfileTextfieldStyle())

      // Last name
      TextField("Last Name", text: $firstName)
        .textFieldStyle(CreateProfileTextfieldStyle())

      Spacer()

      Button {
        //  End Onboarding (Formerly called Next step, we are ending onboarding here since not syncing contacts)

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


struct CreateProfileView_Previews: PreviewProvider {
    static var previews: some View {
      CreateProfileView(currentStep: .constant(.profile), isOnboarding: .constant(true))
    }
}
