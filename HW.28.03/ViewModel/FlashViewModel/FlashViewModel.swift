//
//  FlashViewModel.swift
//  HW.28.03
//
//  Created by zalkarbek on 28/3/23.
//

import UIKit

class FlashViewModel {
    
    private let networkService = NetworkService.shared
    
    var flash: [FlashModel] = []
    
    func fetchFlshSale() async throws -> [FlashModel] {
        return try await networkService.fetchFlashSale()
    }
}
