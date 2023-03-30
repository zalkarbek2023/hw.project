//
//  LoginViewController.swift
//  HW.28.03
//
//  Created by zalkarbek on 28/3/23.
//

import UIKit

class LoginViewController: UIViewController, StoryBoardable {

    @IBOutlet weak var firstNameLoginTF: UITextField!
    
    @IBOutlet weak var passwordLoginTF: UITextField!
    
    @IBOutlet weak var statusTextLabel: UILabel!
    
    
    weak var coordinator: AppCoordinator?
    var userViewModel: UserViewModel?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        bindLoginViewModel()
        initialState()
    }
    
    func initialState() {
        statusTextLabel.textColor = UIColor.white
        statusTextLabel.text = ""
    }
    
    func bindLoginViewModel() {
        userViewModel!.statusText.bind({ (statusText) in
            DispatchQueue.main.async {
                self.statusTextLabel.text = statusText
            }
        })
        userViewModel!.statusColor.bind( { (statusColor) in
            DispatchQueue.main.async {
                self.statusTextLabel.textColor = statusColor
            }
        })
    }
    
    
    
    @IBAction func loginPressed(_ sender: UIButton) {
        userViewModel?.proverka(login: firstNameLoginTF.text!, password: passwordLoginTF.text!)
        if userViewModel!.isLoggedIn {
            coordinator?.isLoggedIN = userViewModel!.isLoggedIn
            coordinator?.showTabBar()
        }
    }
    
}
