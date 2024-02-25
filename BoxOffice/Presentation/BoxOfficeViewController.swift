//
//  BoxOfficeViewController.swift
//  BoxOffice
//
//  Created by nayeon  on 2/26/24.
//

import UIKit

class BoxOfficeViewController: UIViewController {
    let collectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.translatesAutoresizingMaskIntoConstraints = false

        return collectionView
    }()

    override func viewDidLoad() {
        super.viewDidLoad()

        configureUI()
        setupConstraint()
        setupNavigationBar()
    }
}

extension BoxOfficeViewController {
    func configureUI() {
        view.backgroundColor = .systemBackground
        view.addSubview(collectionView)
    }

    func setupConstraint() {
        let safaArea = view.safeAreaLayoutGuide

        NSLayoutConstraint.activate([
            collectionView.leadingAnchor.constraint(equalTo: safaArea.leadingAnchor),
            collectionView.trailingAnchor.constraint(equalTo: safaArea.trailingAnchor),
            collectionView.topAnchor.constraint(equalTo: safaArea.topAnchor),
            collectionView.bottomAnchor.constraint(equalTo: safaArea.bottomAnchor)
        ])
    }

    func setupNavigationBar() {

    }
}
