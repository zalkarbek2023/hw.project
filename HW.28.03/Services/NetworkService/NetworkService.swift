//
//  NetworkService.swift
//  HW.28.03
//
//  Created by zalkarbek on 28/3/23.
//

import UIKit

final class NetworkService {
    
    static let shared = NetworkService()
    
    private init() { }
    
    func fetchLatest() async throws -> [LatestModel] {
        let request = URLRequest(url: Constants.latestUrl)
        let (data, _) = try await URLSession.shared.data(for: request)
        let model: Latest = try NetworkHelpers.decode(with: data)
        return model.latest
    }
    
    func fetchFlashSale() async throws -> [FlashModel] {
        let request = URLRequest(url: Constants.flashUrl)
        let (data, _) = try await URLSession.shared.data(for: request)
        let model: FlashSale = try NetworkHelpers.decode(with: data)
        return model.flash_sale
    }
}
