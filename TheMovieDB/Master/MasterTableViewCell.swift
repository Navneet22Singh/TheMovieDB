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
    
    var viewModel: MasterTableViewCellViewModel?
    weak var parent: MasterViewController?
    
    // MARK - Configure View
    func configure(with viewModel: MasterTableViewCellViewModel, parent: MasterViewController) {
        self.viewModel = viewModel
        self.parent = parent
        
        viewModel.fetch { [weak self] success in
            DispatchQueue.main.async {
                if success {
                    self?.collectionView.reloadData()
                }
            }
        }
    }
}

// MARK: - Collection View
extension MasterTableViewCell: UICollectionViewDelegate, UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return viewModel?.movies.count ?? 4
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: String(describing: MasterCollectionViewCell.self), for: indexPath)
        if let cell = cell as? MasterCollectionViewCell {
            cell.configureView(with: MasterCollectionViewCellModel(path: viewModel?.movies[indexPath.row].posterPath, cache: viewModel?.cache))
        }
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        guard let movie = viewModel?.movies[indexPath.row] else { return }
        parent?.performSegue(withIdentifier: "showDetail", sender: movie)
    }
}
