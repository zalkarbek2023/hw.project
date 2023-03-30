//
//  FlashCollectionViewCell.swift
//  HW.28.03
//
//  Created by zalkarbek on 28/3/23.
//

import UIKit

class FlashSaleCollectionViewCell: UICollectionViewCell {

    static let reuseId = String(describing: FlashSaleCollectionViewCell.self)
    
    @IBOutlet private weak var mainImage: UIImageView!
    @IBOutlet private weak var categoryLabel: UILabel!
    @IBOutlet private weak var nameLabel: UILabel!
    @IBOutlet private weak var priceLabel: UILabel!
    @IBOutlet private weak var discountLabel: UILabel!
    
        private var getFlash: FlashModel?
        func displayFlash(_ items: FlashModel) {
        getFlash = items
        categoryLabel.text! = items.category
        nameLabel.text! = items.name
        priceLabel.text! = String(items.price)
        discountLabel.text! = String(items.discount!)
        loadImageURL(url: items.image_url)
    }
    
    func loadImageURL(url: String) {
        guard let url = URL(string: url) else {
            return
        }
        
        let task = URLSession.shared.dataTask(with: url) { data, response, error in
            if let error = error {
                print("Error \(error.localizedDescription)")
            }
            guard let data = data else { return }
            DispatchQueue.main.async {
                self.mainImage.image = UIImage(data: data)!
            }
        }
        task.resume()
    }

}
