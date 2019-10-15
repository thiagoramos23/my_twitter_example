//
//  CircleProfileImageView.swift
//  MyTwitterExample
//
//  Created by Thiago Ramos on 13/10/19.
//  Copyright © 2019 Thiago Ramos. All rights reserved.
//

import SwiftUI

struct CircleProfileImageView: View {
    var profileImage: Image
    var width: CGFloat = 40
    var height: CGFloat = 40
    
    var body: some View {
        profileImage
            .resizable()
            .aspectRatio(contentMode: .fill)
            .frame(width: self.width, height: self.height)
            .clipShape(Circle())
    }
}

struct CircleProfileImageView_Previews: PreviewProvider {
    static var previews: some View {
        CircleProfileImageView(profileImage: Image("profile1"))
    }
}
