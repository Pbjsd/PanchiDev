//
//  DatabaseService.swift
//  Panchi
//
//  Created by Panchi on 7/12/23.
//

import Foundation
import Firebase
import FirebaseFirestoreSwift
import FirebaseStorage
import UIKit

class DatabaseService {

  // TODO: this is what you were trying to do to sanitize the phone number issue
  //  func getPlatformUsers(phone: String) {
  //
  //
  //              // Turn the contact into a phone number as a string
  //              TextHelper.sanitizePhoneNumber(.phone.first?.value.stringValue ?? "")
  //          }


  func setUserProfile(firstName: String, lastName: String, image: UIImage?, completion: @escaping(Bool) -> Void) {

    // Ensure that the user is logged in
    guard AuthViewModel.isUserLoggedIn() != false else {
      // User is not logged in
      return
    }

    // Get user's phone number
    let userPhone = TextHelper.sanitizePhoneNumber(AuthViewModel.getLoggedInUserPhone())

    // Get a reference to Firestore
    let db = Firestore.firestore()

    // Set the profile data
    let doc = db.collection("users").document(AuthViewModel.getLoggedInUserId())
    doc.setData(["firstname": firstName,
                 "lastname": lastName,
                 "phone": userPhone])

// testing note only - ignore this note 
    // Check if an image is passed through
    if let image = image {

      // Create storage reference
      let storageRef = Storage.storage().reference()

      // Turn our image into data
      let imageData = image.jpegData(compressionQuality: 0.8)

      // Check that we were able to convert it to data
      guard imageData != nil else {
        return
      }

      // Specify the file path and name
      let path = "images/\(UUID().uuidString).jpg"
      let fileRef = storageRef.child(path)

      let uploadTask = fileRef.putData(imageData!, metadata: nil) { meta, error in

        if error == nil && meta != nil
        {
          // Get full url to image
          fileRef.downloadURL { url, error in

            // Check for errors
            if url != nil && error == nil {

              // Set that image path to the profile
              doc.setData(["photo": url!.absoluteString], merge: true) { error in

                if error == nil {
                  // Success, notify caller - if it's success, we'll call completion and we'll pass back true
                  completion(true)
                }
              }

            }
            else {
              // Wasn't successful in getting download url for photo
              completion(false)
            }
          }


        }
        else {

          // Upload wasn't successful, notify caller - otherwise, we'll pass back false
          completion(false)
        }
      }


    }
    else {
      // No image was set
      completion(true)
    }
  }

  func checkUserProfile(completion: @escaping (Bool) -> Void) {

    // Check that the user is logged
    guard AuthViewModel.isUserLoggedIn() != false else {
      return
    }

    // Create firebase ref
    let db = Firestore.firestore()

    db.collection("users").document(AuthViewModel.getLoggedInUserId()).getDocument { snapshot, error in


      // TODO: Keep the users profile data
      if snapshot != nil && error == nil {

        // Notify that profile exists
        completion(snapshot!.exists)
      }
      else {
        // TODO: Look into using Result type to indicate failure vs profile exists
        completion(false)
      }

    }


  }
}
