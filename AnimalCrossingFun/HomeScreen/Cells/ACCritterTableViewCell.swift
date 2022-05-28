//
//  CritterTableViewCell.swift
//  AnimalCrossingFun
//
//  Created by Philip Martin on 18/05/2022.
//

import UIKit
import FlexLayout

class ACCritterTableViewCell: UITableViewCell {
    
    // MARK: - Reuseidentifier
    static let reuseidentifier: String = "ACCritterTableViewCell"
    
    // MARK: - Properties
    private let cardView = UIView()
    private let critterLabel = UILabel()
    private let iconImage = UIImageView(image: UIImage(systemName: "chevron.forward")?.withTintColor(Colour.AnimalCrossingPrimary100 ?? .black, renderingMode: .alwaysOriginal))
    
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
    
    override func traitCollectionDidChange(_ previousTraitCollection: UITraitCollection?) {
        super.traitCollectionDidChange(previousTraitCollection)
        updateCardColour()
    }
    
    // MARK: - Private helpers
    private func layout() {
        contentView.flex.layout(mode: .adjustHeight)
    }

    private func setup() {
        backgroundColor = .clear
        updateCardColour()
        critterLabel.numberOfLines = 0
        critterLabel.font = UIFont.boldSystemFont(ofSize: 16)
    }
    
    private func updateCardColour() {
        cardView.backgroundColor = .systemBackground
    }
    
    private func addChildViews() {
        contentView.flex.define { (flex) in
            flex.addItem(cardView).direction(.row).marginLeft(10).marginRight(10).marginBottom(10).define { (flex) in
                flex.addItem(critterLabel).margin(16)
                flex.addItem().direction(.column).grow(1).shrink(1).alignItems(.end).define { flex in
                    flex.addItem().direction(.row).grow(1).alignItems(.center).define { flex in
                        flex.addItem(iconImage).marginRight(16)
                    }
                }
            }
        }
    }
    
    private func addStyling() {
        cardView.roundCornerWithShadow(cornerRadius: 8, shadowRadius: 8, offsetX: 2, offsetY: 5, colour: .lightGray, opacity: 0.6)
    }
    
    // MARK: - Public Helpers
    func populate(critter: CritterModel?) {
        critterLabel.text = critter?.critterType.critterDescription
        layoutSubviews()
    }
    
}
