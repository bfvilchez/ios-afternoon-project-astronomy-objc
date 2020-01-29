//
//  RoverImagesCollectionViewController.swift
//  Astronomy
//
//  Created by brian vilchez on 1/27/20.
//  Copyright © 2020 brian vilchez. All rights reserved.
//

import UIKit

class RoverImagesCollectionViewController: UICollectionViewController {

    var roverController = RoverController()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        roverController.fetchRoverCompletion { (error) in
            print(self.roverController.rovers.count)
            
            DispatchQueue.main.async {
                self.collectionView.reloadData()
            }
        }
   
    }


    // MARK: UICollectionViewDataSource

    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of items
        return roverController.rovers.count
    }

    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "ImageCell", for: indexPath) as? ImageCollectionViewCell else {return UICollectionViewCell()}
        let rover = roverController.rovers[indexPath.row]
        cell.Rover = rover
        return cell
    }

}
