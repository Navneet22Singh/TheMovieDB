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
    
    override func awakeFromNib() {
        super.awakeFromNib()
        prepareForReuse()
    }
    
    func configure(with viewModel: MasterTableViewCellViewModel, parent: MasterViewController) {
        self.viewModel = viewModel
        self.parent = parent
        
        viewModel.fetch { [weak self] (moviesResult, error) in
            guard let movies = moviesResult?.movies else {
                return
            }
                        
            DispatchQueue.main.async {
                self?.refreshMovies(movies)
            }
        }
    }

    private func refreshMovies(_ movies: [Movie]) {
        viewModel?.movies.append(contentsOf: movies)
        collectionView.reloadData()
    }
    
    override func prepareForReuse() {
        
    }
}

extension MasterTableViewCell: UICollectionViewDelegate, UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return viewModel?.movies.count ?? 3
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
