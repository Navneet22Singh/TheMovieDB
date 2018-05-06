//
//  MasterTableViewCell.swift
//  TheMovieDB
//
//  Created by Navneet on 5/6/18.
//  Copyright © 2018 Navneet. All rights reserved.
//

import UIKit

class MasterTableViewCell: UITableViewCell {

    @IBOutlet var collectionView: UICollectionView!
    
    let viewModel = MaterTableViewCellViewModel()
    weak var parent: MasterViewController?
    
    override func awakeFromNib() {
        super.awakeFromNib()
        prepareForReuse()
    }
    
    func configure(with urlString: String, parent: MasterViewController) {
        self.parent = parent
        
        viewModel.fetch(from: urlString) { [unowned self] _ in
            self.collectionView.reloadData()
        }
    }

    override func prepareForReuse() {
        
    }
}

extension MasterTableViewCell: UICollectionViewDelegate, UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 10
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "CollectionViewCell", for: indexPath)
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        parent?.performSegue(withIdentifier: "showDetail", sender: nil)
    }
}
