//
//  UserViewModel.swift
//  HW.28.03
//
//  Created by zalkarbek on 30/3/23.
//

import UIKit

class UserViewModel {
    var users = UsersData.userData
    var isLoggedIn = false
    var statusText = Dynamic("")
    var statusColor = Dynamic(UIColor.white)
    
    func proverka(login: String, password: String) {
        if login != Users.logins[0].firstName || password != Users.logins[0].password {
            isLoggedIn = false
            statusText.value = "Login in failed"
            statusColor.value = UIColor.red
        } else {
            isLoggedIn = true
            statusText.value = "You successfully logged in."
            statusColor.value = UIColor.magenta
        }
    }
    
    func addUserData(firstName: String, lastName: String, email: String) {
        users.firstName?.append(contentsOf: firstName)
        users.lastName?.append(contentsOf: lastName)
        users.email?.append(contentsOf: email)
        isLoggedIn = true
        print("Name: \(firstName) Lastname: \(lastName), email: \(email)")
    }
}
