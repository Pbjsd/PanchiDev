//
//  testing.swift
//  Panchi
//
//  Created by Panchi on 9/7/23.
//

import SwiftUI

struct testing: View {

  var body: some View {
    Color.purple
      .ignoresSafeArea() // Ignore just for the color
      .overlay(
        VStack(spacing: 20) {
          Text("Overlay").font(.largeTitle)
          Text("Example").font(.title).foregroundColor(.white)
        })
  }

  struct testing_Previews: PreviewProvider {
    static var previews: some View {
      testing()
    }
  }
}
