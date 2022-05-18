//
//  ACProfileTableViewCell.swift
//  AnimalCrossingFun
//
//  Created by Philip Martin on 18/05/2022.
//

import UIKit

class ACProfileTableViewCell: UITableViewCell {

    // MARK: - Reuseidentifier
    static let reuseidentifier: String = "ACProfileTableViewCell"
    
    // MARK: - Properties
    private let cardView = UIView()
    private let profilePicture = UIImageView()
    private let nameLabel = UILabel()
    
    // MARK: - Initaliser
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setup()
        addChildViews()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        addStyling()
        layout()
    }
    
    override func sizeThatFits(_ size: CGSize) -> CGSize {
        // 1) Set the contentView's width to the specified size parameter
        contentView.pin.width(size.width)
        
        // 2) Layout contentView flex container
        layout()
        
        // Return the flex container new size
        return contentView.frame.size
    }
    
    // MARK: - Private helpers
    private func layout() {
        contentView.flex.layout(mode: .adjustHeight)
    }
    
    private func addChildViews() {
        contentView.flex.define { (flex) in
            flex.addItem(cardView).direction(.column).alignItems(.center).marginLeft(10).marginRight(10).marginBottom(10).define { (flex) in
                flex.addItem().direction(.row).padding(10).define { flex in
                    flex.addItem(profilePicture).width(100).height(100)
                }
                flex.addItem().direction(.row).padding(10).define { flex in
                    flex.addItem(nameLabel)
                }
            }
        }
    }
    
    private func setup() {
        cardView.backgroundColor = .systemBackground
        backgroundColor = .clear
        profilePicture.layer.cornerRadius = 100/2
        profilePicture.backgroundColor = .blue
        nameLabel.numberOfLines = 0
        nameLabel.text = "Ronnie Martin"
        nameLabel.font = UIFont.systemFont(ofSize: 16)
    }
    
    private func addStyling() {
        cardView.roundCornerWithShadow(cornerRadius: 8, shadowRadius: 8, offsetX: 2, offsetY: 5, colour: .lightGray, opacity: 0.6)
    }

}
