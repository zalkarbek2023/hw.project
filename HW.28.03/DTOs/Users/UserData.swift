//
//  UserData.swift
//  HW.28.03
//
//  Created by zalkarbek on 29/3/23.
//

import UIKit

struct UsersData {
    var firstName: String?
    var lastName: String?
    var email: String?
    
    private init() {}
}

extension UsersData {
    static var userData = UsersData()
}
