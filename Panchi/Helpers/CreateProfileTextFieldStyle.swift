//
//  CreateProfileTextFieldStyle.swift
//  Panchi
//
//  Created by Panchi on 6/28/23.
//

import Foundation
import SwiftUI

struct CreateProfileTextfieldStyle: TextFieldStyle {

  func _body(configuration: TextField<Self._Label>) -> some View {

    ZStack {
      Rectangle()
        .foregroundColor(Color("input"))
        .cornerRadius(8)
        .frame(height: 46)

      // This reference the textfield 
      configuration
        .font(Font.tabBar)
        .padding()
    }


  }


}
