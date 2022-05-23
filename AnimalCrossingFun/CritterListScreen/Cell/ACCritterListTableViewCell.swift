//
//  ACCritterListTableViewCell.swift
//  AnimalCrossingFun
//
//  Created by Philip Martin on 23/05/2022.
//

import UIKit
import FlexLayout
import SDWebImage

class ACCritterListTableViewCell: UITableViewCell {

    // MARK: - Reuseidentifier
    static let reuseidentifier: String = "ACCritterListTableViewCell"
    
    // MARK: - Properties
    private let cardView = UIView()
    private let critterLabel = UILabel()
    private let critterIconImage = UIImageView()
    private let iconImage = UIImageView(image: UIImage(systemName: "chevron.forward")?.withTintColor(Colour.AnimalCrossingPrimary100 ?? .black, renderingMode: .alwaysOriginal))
    private let imageSize: CGFloat = 80
    
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
    
    private func setup() {
        backgroundColor = .clear
        critterIconImage.sd_imageIndicator = SDWebImageActivityIndicator.gray
        cardView.backgroundColor = .systemBackground
        critterLabel.numberOfLines = 0
        critterLabel.font = UIFont.boldSystemFont(ofSize: 16)
        critterIconImage.contentMode = .scaleAspectFit
        critterIconImage.layer.borderColor = UIColor.black.cgColor
        critterIconImage.layer.borderWidth = 2.0
        critterIconImage.backgroundColor = Colour.AnimalCrossingPrimary100
        critterIconImage.layer.cornerRadius = imageSize/2
    }
    
    private func addChildViews() {
        contentView.flex.define { (flex) in
            flex.addItem().direction(.column).margin(10).grow(1).define { flex in
                flex.addItem().direction(.row).grow(1).define { flex in
                    flex.addItem(critterIconImage).width(imageSize).height(imageSize)
                    flex.addItem(cardView).direction(.row).grow(1).alignItems(.center).marginTop(20).marginBottom(30).grow(1).marginLeft(10).marginRight(10).marginBottom(10).define { (flex) in
                        flex.addItem(critterLabel).grow(1).marginLeft(10).marginRight(10)
                        flex.addItem().direction(.column).grow(1).shrink(1).alignItems(.end).define { flex in
                            flex.addItem().direction(.row).grow(1).alignItems(.center).define { flex in
                                flex.addItem(iconImage).marginRight(16)
                            }
                        }
                    }
                }
            }
        }
    }
    
    private func addStyling() {
        cardView.roundCornerWithShadow(cornerRadius: 8, shadowRadius: 8, offsetX: 2, offsetY: 5, colour: .lightGray, opacity: 0.6)
    }
    
    // MARK: - Public Helpers
    func populate(critter: CritterResponseModel?) {
        critterIconImage.sd_setImage(with: URL(string: (critter?.iconURI!)!), placeholderImage: nil)
        critterLabel.text = critter?.name.nameEUen
        layoutSubviews()
    }
}
