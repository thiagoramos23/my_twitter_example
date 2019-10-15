//
//  UserState.swift
//  MyTwitterExample
//
//  Created by Thiago Ramos on 13/10/19.
//  Copyright © 2019 Thiago Ramos. All rights reserved.
//

import Foundation
import Combine

class UserState : ObservableObject {
    @Published var isMenuOpen : Bool = false
}
