//
//  DatabaseService.swift
//  Panchi
//
//  Created by Panchi on 7/12/23.
//

import Foundation
import Firebase


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


  func setUserProfile(firstName: String, lastName: String, image: UIImage?) {

    // TODO: Guard against logged out users

    // Get a reference to Firestore
    let db = Firestore.firestore()

    // Set the profile data
    // TODO: After implementing authentication, instead create a document with the actual user's id
    let doc = db.collection("users").document()
    doc.setData(["firstname": firstName,
                 "lastname": lastName])
    // Check if an image is passed through

    // Upload the image data

    // Set that image path to the profile

  }

}

