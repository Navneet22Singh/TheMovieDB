//
//  DetailViewController.swift
//  TheMovieDB
//
//  Created by Navneet on 5/6/18.
//  Copyright © 2018 Navneet. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController {

    @IBOutlet weak var bannerImgView: UIImageView!
    @IBOutlet weak var movieNameLabel: UILabel!
    @IBOutlet weak var ratingLabel: UILabel!
    @IBOutlet weak var overviewLabel: UILabel!
    
    var viewModel: DetailViewModel?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureView()
    }
    
    // Congigure View
    private func configureView() {
        title = viewModel?.title
        
        bannerImgView.image = viewModel?.image
        movieNameLabel.text = viewModel?.movieName
        ratingLabel.text = viewModel?.rating
        overviewLabel.text = viewModel?.overview
    }
}

