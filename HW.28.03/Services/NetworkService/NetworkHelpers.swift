//
//  NetworkHelpers.swift
//  HW.28.03
//
//  Created by zalkarbek on 28/3/23.
//

import UIKit

struct NetworkHelpers {
    static func decode<T: Decodable>(with data: Data) throws -> T {
        try JSONDecoder().decode(T.self, from: data)
    }
}
