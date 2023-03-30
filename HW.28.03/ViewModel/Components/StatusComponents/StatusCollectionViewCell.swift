//
//  StatusCollectionViewCell.swift
//  HW.28.03
//
//  Created by zalkarbek on 28/3/23.
//

import UIKit

class StatusCollectionViewCell: UICollectionViewCell {

    static let reuseId = String(describing: StatusCollectionViewCell.self)
    
    @IBOutlet weak var statusView: UIView!
    
    @IBOutlet weak var statusImage: UIImageView!
    
    @IBOutlet weak var statusLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    func displayStatus(_ item: StatusModel) {
        statusImage.image = item.img
        statusLabel.text = item.name
        statusImage.layer.cornerRadius = statusImage.frame.size.width/2
        statusView.layer.cornerRadius = statusView.frame.height / 2
        statusView.backgroundColor = .systemGray5
        statusLabel.textColor = .gray
    }

}
