//
//  LatestModel.swift
//  HW.28.03
//
//  Created by zalkarbek on 28/3/23.
//

import UIKit

struct Latest: Codable {
    let latest: [LatestModel]
}

struct LatestModel: Codable {
    let category: String
    let name: String
    let price: Int
    let image_url: String
}
