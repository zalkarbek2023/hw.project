//
//  Storyboardable.swift
//  HW.28.03
//
//  Created by zalkarbek on 28/3/23.
//

import UIKit

protocol StoryBoardable {
    static func createObject() -> Self
}

extension StoryBoardable where Self: UIViewController {
    static func createObject() -> Self {
        let id = String(describing: self)
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        return storyboard.instantiateViewController(identifier: id) as! Self
    }
}

