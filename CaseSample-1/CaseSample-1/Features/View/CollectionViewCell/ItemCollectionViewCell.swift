//
//  ItemCollectionViewCell.swift
//  CaseSample-1
//
//  Created by Arslan Kaan AYDIN on 13.04.2022.
//

import UIKit
import SnapKit

class ItemCollectionViewCell: UICollectionViewCell {
    
    enum Identifier: String {
        case custom = "ItemCollectionViewCell"
    }
    
    private let imageView: UIImageView = UIImageView()
    private let nameLabel: UILabel = UILabel()
    private let priceLabel: UILabel = UILabel()
    private let releaseDateLabel: UILabel = UILabel()
    private let image = UIImage(named: "image")
    private let colors = [
        UIColor.gray,
        UIColor.red,
        UIColor.blue,
        UIColor.green,
        UIColor.magenta,
    ]
    
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
    private func drawDesign() {
        imageView.image = image
        imageView.contentMode =  .scaleAspectFit
        imageView.clipsToBounds = true
        imageView.backgroundColor = colors.randomElement()
        nameLabel.text = "Kus Avcilari"
        priceLabel.text = "$999"
        releaseDateLabel.text = "01.01.2022"
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
        }
    }
    
    private func makePriceLabel() {
        priceLabel.snp.makeConstraints { make in
            make.top.equalTo(nameLabel.snp.bottom).offset(5)
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
