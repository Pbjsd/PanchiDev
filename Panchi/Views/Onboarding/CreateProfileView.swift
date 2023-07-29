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

  @State var selectedImage: UIImage?
  @State var isPickerShowing = false

  @State var isSourceMenuShowing = false
  @State var source: UIImagePickerController.SourceType = .photoLibrary

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
        isSourceMenuShowing = true

      } label: {

        ZStack {

          if selectedImage != nil {
            Image(uiImage: selectedImage!)
              .resizable()
              .scaledToFill()
              .clipShape(Circle())
          }
          else {
            Circle()
              .foregroundColor(Color.white)

            Image(systemName: "camera.fill")
              .tint(Color("icons-input"))
          }

          Circle()
            .stroke(Color("create-profile-border"), lineWidth: 2)
          
        }
        .frame(width: 134, height: 134)

      }

      Spacer()

      // First name
      TextField("Given Name", text: $firstName)
        .textFieldStyle(CreateProfileTextfieldStyle())

      // Last name
      TextField("Last Name", text: $lastName)
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
    .confirmationDialog("From where?", isPresented: $isSourceMenuShowing, actions: {

      Button {
        // Set the source to photo library
        self.source = .photoLibrary

        // Show the image picker
        isPickerShowing = true

      } label: {
        Text("Photo Library")
      }

      if UIImagePickerController.isSourceTypeAvailable(.camera) {

        Button {
          // Set the source to camera
          self.source = .camera

          // Show the image picker
          isPickerShowing = true
        } label: {
          Text("Take Photo")
        }
      }


    })
    .sheet(isPresented: $isPickerShowing) {

      // Show the image picker
      ImagePicker(selectedImage: $selectedImage, isPickerShowing: $isPickerShowing, source: self.source)
    }

  }
}


struct CreateProfileView_Previews: PreviewProvider {
  static var previews: some View {
    CreateProfileView(currentStep: .constant(.profile), isOnboarding: .constant(true))
  }
}
