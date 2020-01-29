//
//  ImageCollectionViewCell.swift
//  Astronomy
//
//  Created by brian vilchez on 1/28/20.
//  Copyright © 2020 brian vilchez. All rights reserved.
//

import UIKit

class ImageCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak var photoView: UIImageView!
    var Rover: Rover? {
        didSet {
            updateViews()
        }
    }
    
    private func updateViews() {
        guard let rover = Rover else { return }
        
    }
    
//    private func getImage(fromString imageString: String) -> UIImage {
//        return UIImage
//    }
    
}
