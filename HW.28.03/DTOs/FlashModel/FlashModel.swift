//
//  FlashModel.swift
//  HW.28.03
//
//  Created by zalkarbek on 28/3/23.
//

import UIKit

struct FlashSale: Codable {
    let flash_sale: [FlashModel]
}

struct FlashModel: Codable {
    let category: String
    let name: String
    let price: Double
    let discount: Int?
    let image_url: String
    
}
