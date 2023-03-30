//
//  LatestViewModel.swift
//  HW.28.03
//
//  Created by zalkarbek on 28/3/23.
//

import UIKit

class LatestViewModel {
    
    private let networkService = NetworkService.shared
    
    var latest: [LatestModel] = []
    
    func fetchLatest() async throws -> [LatestModel] {
        return try await networkService.fetchLatest()
    }
}
