//
//  CircleImage.swift
//  Darty - Best Drinking Game
//
//  Created by Colton Lipchak on 2/4/20.
//  Copyright © 2020 clipchak. All rights reserved.
//
//  holds the logo image

import SwiftUI

struct CircleImage: View {
    var body: some View {
        Image("logo")
            .resizable()
            .scaledToFit()
            .frame(width: 200.0,height:200)
            .clipShape(Circle())
            .overlay(Circle().stroke(Color.white, lineWidth: 4))
            .shadow(radius: 10)
        
    }
}

struct CircleImage_Previews: PreviewProvider {
    static var previews: some View {
        CircleImage()
    }
}
