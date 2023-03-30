//
//  Dynamic.swift
//  HW.28.03
//
//  Created by zalkarbek on 30/3/23.
//

import UIKit

class Dynamic<T> {
    typealias Listener = (T) -> Void
    private var listener: Listener?
    
    func bind(_ listener: Listener?) {
        self.listener = listener
    }
    
    var value: T {
        didSet {
            listener?(value)
        }
    }
    
    init(_ v: T) {
        self.value = v
    }
}
