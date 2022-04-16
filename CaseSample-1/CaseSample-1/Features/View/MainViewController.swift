//
//  MainViewController.swift
//  CaseSample-1
//
//  Created by Arslan Kaan AYDIN on 12.04.2022.
//

import UIKit
import SnapKit

protocol ITunesOutput {
    func saveDatas(values: [Result])
}

final class MainViewController: UIViewController {
    
 
    
    private let searchBar: UISearchBar = UISearchBar()
    private let collectionView: UICollectionView = UICollectionView(
        frame: .zero,
        collectionViewLayout: UICollectionViewFlowLayout()
    )
    private let segmentedControls: UISegmentedControl = UISegmentedControl(items: ["Movies", "Music", "Apps", "Books"])
    
    private lazy var results: [Result] = []
    lazy var viewModel: IITunesViewModel = ITunesViewModel()

    override func viewDidLoad() {
        super.viewDidLoad()
        configure()
        viewModel.setDelegate(output: self)
        viewModel.fetchItems()
        print(ITunesServiceEndPoint.newsPath())
    }
    func configure () {
        addSubviews()
        drawDesign()
        addSegmentedControl()
        makeSearchBar()
        makeSegmentedControl()
        makeCollectionView()
    }
    
    func drawDesign() {
        view.backgroundColor = .white
        searchBar.placeholder = "Search"
        searchBar.searchBarStyle = .minimal
        segmentedControls.selectedSegmentTintColor = .orange
        segmentedControls.selectedSegmentIndex = 0
        collectionView.delegate = self
        collectionView.dataSource = self
        collectionView.register(ItemCollectionViewCell.self, forCellWithReuseIdentifier: ItemCollectionViewCell.Identifier.custom.rawValue)
    }
    
    func addSubviews() {
        view.addSubview(searchBar)
        view.addSubview(segmentedControls)
        view.addSubview(collectionView)
    }
    
}

extension MainViewController: ITunesOutput {
    func saveDatas(values: [Result]) {
        results = values
        collectionView.reloadData()
        print(results.count)
    }
}

extension MainViewController {
    
    private func makeSearchBar() {
        searchBar.snp.makeConstraints { make in
            make.top.equalTo(view.safeAreaLayoutGuide.snp.top)
            make.left.equalToSuperview().offset(10)
            make.right.equalToSuperview().offset(-10)
        }
    }
    
    private func makeSegmentedControl() {
        segmentedControls.snp.makeConstraints { make in
            make.top.equalTo(searchBar.snp.bottom).offset(5)
            make.left.equalTo(searchBar).offset(7)
            make.right.equalTo(searchBar).offset(-7)
        }
    }
    
    private func makeCollectionView() {
        collectionView.snp.makeConstraints { make in
            make.top.equalTo(segmentedControls.snp.bottom).offset(10)
            make.left.right.equalTo(segmentedControls)
            make.bottom.equalToSuperview().offset(-10)
        }
    }
}

extension MainViewController {
    
    private func addSegmentedControl() {
        segmentedControls.addTarget(self, action: #selector(segmentedControlDidChange(_:)) , for: .valueChanged)
    }
    
    @objc func segmentedControlDidChange(_ segmentedControl: UISegmentedControl) {
        switch segmentedControl.selectedSegmentIndex {
        case 0:
            print("Movies")
        case 1:
            print("Music")
        case 2:
            print("Apps")
        case 3:
            print("Books")
        default:
            print("Default")
        }
    }
    
}

extension MainViewController: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return results.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell: ItemCollectionViewCell = collectionView.dequeueReusableCell(withReuseIdentifier: ItemCollectionViewCell.Identifier.custom.rawValue, for: indexPath) as! ItemCollectionViewCell
        cell.saveModel(model: results[indexPath.row])
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(
            width: (view.frame.size.width/2.3),
            height: (view.frame.size.height/3)
        )
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 10
    }
    
}
