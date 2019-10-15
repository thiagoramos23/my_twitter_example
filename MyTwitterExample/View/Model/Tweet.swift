//
//  Tweet.swift
//  MyTwitterExample
//
//  Created by Thiago Ramos on 07/10/19.
//  Copyright © 2019 Thiago Ramos. All rights reserved.
//

import Foundation
import SwiftUI

struct Tweet: Identifiable {
    var id = UUID()
    var userName: String
    var userNickName: String
    var text: String
    var profileImage: Image
}
