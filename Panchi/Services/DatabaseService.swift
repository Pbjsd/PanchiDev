//
//  DatabaseService.swift
//  Panchi
//
//  Created by Panchi on 7/12/23.
//

import Foundation
import Firebase
import FirebaseStorage
import UIKit


//// this is empty bc we are not adding any of the contacts stuff here - so don't copy all the stuff from the original app course

// listen: if you can't figure out the phone number issue, then just use email address as a sign in
// issue: I don't know how to add the sanitizePhoneNumber function here. This can be figured out later



class DatabaseService {

  // TODO: this is what you were trying to do to sanitize the phone number issue
  //  func getPlatformUsers(phone: String) {
  //
  //
  //              // Turn the contact into a phone number as a string
  //              TextHelper.sanitizePhoneNumber(.phone.first?.value.stringValue ?? "")
  //          }


  func setUserProfile(firstName: String, lastName: String, image: UIImage?, completion: @escaping(Bool) -> Void) {

    // TODO: Guard against logged out users

    // Get a reference to Firestore
    let db = Firestore.firestore()

    // Set the profile data
    // TODO: After implementing authentication, instead create a document with the actual user's id
    let doc = db.collection("users").document()
    doc.setData(["firstname": firstName,
                 "lastname": lastName])


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

        }

      }

      // Set that image path to the profile
      doc.setData(["photo": path], merge: true) { error in
        if error == nil {
          // Success, notify caller - if it's success, we'll call completion and we'll pass back true
          completion(true)
        }
      }
    }
    else {

      // Upload wasn't successful, notify caller - otherwise, we'll pass back false
      completion(false)
    }
  }

}

