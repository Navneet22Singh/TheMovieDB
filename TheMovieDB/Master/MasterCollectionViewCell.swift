//
//  MasterCollectionViewCell.swift
//  TheMovieDB
//
//  Created by Navneet on 5/6/18.
//  Copyright © 2018 Navneet. All rights reserved.
//

import UIKit

class MasterCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak var bannerImgView: UIImageView!
    @IBOutlet weak var activityIndicator: UIActivityIndicatorView!
    
    var viewModel: MasterCollectionViewCellModel?
    
    override func awakeFromNib() {
        super.awakeFromNib()
        prepareForReuse()
    }
    
    func configureView(with viewModel: MasterCollectionViewCellModel) {
        self.viewModel = viewModel
        
        guard let image = viewModel.image else {
            fetchImage()
            return
        }
        
        bannerImgView.image = image
        activityIndicator.isHidden = true
    }
    
    private func fetchImage() {
        activityIndicator.isHidden = false
        activityIndicator.startAnimating()
        viewModel?.downloadImage { [weak self] _ in
            DispatchQueue.main.async {
                self?.activityIndicator.stopAnimating()
                self?.bannerImgView.image = self?.viewModel?.image
            }
        }
    }
    
    override func prepareForReuse() {
        bannerImgView.image = nil
    }
}
