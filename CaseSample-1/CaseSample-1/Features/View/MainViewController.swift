//
//  MainViewController.swift
//  CaseSample-1
//
//  Created by Arslan Kaan AYDIN on 12.04.2022.
//

import UIKit
import SnapKit

class MainViewController: UIViewController {
    
    private let searchBar: UISearchBar = UISearchBar()
    private let collectionView: UICollectionView = UICollectionView()
    private let segmentedControls: UISegmentedControl = UISegmentedControl(items: ["Movies", "Music", "Apps", "Books"])

    override func viewDidLoad() {
        super.viewDidLoad()
        
        configure()

    }
    func configure () {
        addSubviews()
        drawDesign()
        addsSegmentedControl()
        makeSearchBar()
        makeSegmentedControl()
    }
    
    func drawDesign() {
        view.backgroundColor = .white
        searchBar.placeholder = "Search"
        searchBar.searchBarStyle = .minimal
        segmentedControls.selectedSegmentTintColor = .orange
        segmentedControls.selectedSegmentIndex = 0
    }
    
    func addSubviews() {
        view.addSubview(searchBar)
        view.addSubview(segmentedControls)
        view.addSubview(collectionView)
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
        }
    }
}

extension MainViewController {
    
    private func addsSegmentedControl() {
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
