//
//  ViewController.swift
//  HW.28.03
//
//  Created by zalkarbek on 28/3/23.
//

import UIKit

class MainViewController: UIViewController, StoryBoardable {

    @IBOutlet weak var firstNameTF: UITextField!
    
    @IBOutlet weak var lastNameTF: UITextField!
    
    @IBOutlet weak var emailTF: UITextField!
    
    @IBOutlet weak var statusText: UILabel!
    
    
    var coordinator: AppCoordinator?
    var userViewModel: UserViewModel?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.

    }
    
    @IBAction func signInPressed(_ sender: UIButton) {
        userViewModel?.addUserData(firstName: firstNameTF.text!, lastName: lastNameTF.text!, email: emailTF.text!)
        if userViewModel!.isLoggedIn {
            coordinator?.isLoggedIN = userViewModel!.isLoggedIn
            coordinator?.showTabBar()
        }
    }
    
    @IBAction func logInPressed(_ sender: UIButton) {
        coordinator?.showLogin()
    }


}

