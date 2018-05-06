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
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        title = "Details"
    }
}

