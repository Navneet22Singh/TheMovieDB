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
    fileprivate var isLoading = false
    
    // MARK - Configure View
    func configure(with viewModel: MasterTableViewCellViewModel, parent: MasterViewController) {
        self.viewModel = viewModel
        self.parent = parent
        loadPage(viewModel.currentPage)
    }
    
    // MARK: - Fetch results
    fileprivate func loadPage(_ page: Int) {
        fetchResults(for: page) { [weak self] success in
            if success {
                self?.collectionView.reloadData()
            }
        }
    }
    
    fileprivate func fetchResults(for page: Int, completion: @escaping (Bool) -> ()) {
        isLoading = true
        viewModel?.fetch(for: page, completion: { [weak self] success in
            DispatchQueue.main.async {
                self?.isLoading = false
                completion(success)
            }
        })
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
            cell.configureView(with: MasterCollectionViewCellModel(path: viewModel?.movies[safe: indexPath.row]?.posterPath))
        }
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        guard let movie = viewModel?.movies[safe: indexPath.row] else { return }
        parent?.performSegue(withIdentifier: "showDetail", sender: movie)
    }
    
    func collectionView(_ collectionView: UICollectionView, willDisplay cell: UICollectionViewCell, forItemAt indexPath: IndexPath) {
        
        guard
            let viewModel = viewModel,
            indexPath.row == viewModel.movies.count - 3,
            viewModel.currentPage < viewModel.totalPages,
            !isLoading
            else { return }
        
        loadPage(viewModel.currentPage + 1)
    }
}
