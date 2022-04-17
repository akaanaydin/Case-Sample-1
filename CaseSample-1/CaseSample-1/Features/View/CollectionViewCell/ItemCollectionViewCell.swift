//
//  ItemCollectionViewCell.swift
//  CaseSample-1
//
//  Created by Arslan Kaan AYDIN on 13.04.2022.
//

import UIKit
import SnapKit
import Kingfisher

class ItemCollectionViewCell: UICollectionViewCell {

    enum Identifier: String {
        case custom = "ItemCollectionViewCell"
    }
    
    private let imageView: UIImageView = UIImageView()
    private let nameLabel: UILabel = UILabel()
    private let priceLabel: UILabel = UILabel()
    private let releaseDateLabel: UILabel = UILabel()
    private let randomImage: String = "https://picsum.photos/200/300"
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        configure()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        imageView.frame = contentView.bounds
    }
    
   
    
    private func configure(){
        addSubviews()
        drawDesign()
        makeImageView()
        makeNameLabel()
        makePriceLabel()
        makeReleaseDateLabel()
    }
    
    func saveModel(model: Result) {
        nameLabel.text = model.trackName
        priceLabel.text = "$\(model.collectionPrice ?? 0.0)"
        releaseDateLabel.text = String("\(model.releaseDate!)".prefix(10))
        imageView.kf.setImage(with: URL(string: model.artworkUrl100 ?? randomImage))
    }
    
    private func drawDesign() {
        nameLabel.numberOfLines = 2
        releaseDateLabel.font = .systemFont(ofSize: 14)
        priceLabel.font = .systemFont(ofSize: 14)
        imageView.contentMode =  .scaleToFill
        imageView.clipsToBounds = true
        imageView.layer.cornerRadius = 12

    }
    
    private func addSubviews() {
        contentView.addSubview(imageView)
        contentView.addSubview(nameLabel)
        contentView.addSubview(priceLabel)
        contentView.addSubview(releaseDateLabel)
    }
}

extension ItemCollectionViewCell {
    private func makeImageView() {
        imageView.snp.makeConstraints { make in
            make.top.equalTo(contentView)
            make.left.right.equalTo(contentView)
            make.bottom.equalTo(contentView).offset(-60)
        }
    }
    
    private func makeNameLabel() {
        nameLabel.snp.makeConstraints { make in
            make.top.equalTo(imageView.snp.bottom)
            make.left.equalTo(imageView).offset(3)
            make.right.equalTo(imageView)
        }
    }
    
    private func makePriceLabel() {
        priceLabel.snp.makeConstraints { make in
            make.bottom.equalTo(contentView)
            make.left.equalTo(nameLabel)
        }
    }
    
    private func makeReleaseDateLabel() {
        releaseDateLabel.snp.makeConstraints { make in
            make.bottom.equalTo(contentView)
            make.right.equalTo(contentView)
        }
    }
}
