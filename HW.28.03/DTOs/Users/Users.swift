//
//  Users.swift
//  HW.28.03
//
//  Created by zalkarbek on 29/3/23.
//

import UIKit

struct Users {
    let firstName: String?
    let password: String?
}

extension Users {
    static var logins = [
        Users(firstName: "Zalkarbek", password: "99")
    ]
}

