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
    @IBOutlet weak var overviewLabel: UILabel!
    
    var viewModel: DetailViewModel?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureView()
    }
    
    private func configureView() {
        title = viewModel?.title
        movieNameLabel.text = viewModel?.movie?.title
        overviewLabel.text = viewModel?.movie?.overview
    }
}

