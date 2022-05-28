//
//  ACCritterDetailView.swift
//  AnimalCrossingFun
//
//  Created by Philip Martin on 28/05/2022.
//

import UIKit
import FlexLayout
import PinLayout

class ACCritterDetailView: UIView {

    // MARK: - Properties
    private let scrollView = UIScrollView()
    private let rootFlexContainer = UIView()
    private let critterImage = UIImageView()
    private let critterNameLabel = UILabel()
    private var critterId = 0
    private var critterType = ""
    private let viewModel = ACCritterDetailViewModel()
    private let imageSize: CGFloat = 150
    
    // MARK: - Initaliser
    init(withCritterId id: Int, type: String) {
        super.init(frame: .zero)
        critterId = id
        critterType = type
        setup()
        addChildViews()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
    // MARK: - Overrides
    override func layoutSubviews() {
        super.layoutSubviews()
        scrollView.pin.all()
        rootFlexContainer.pin.top(5%).left(5%).right(5%)
        rootFlexContainer.flex.layout(mode: .adjustHeight)
        scrollView.contentSize = rootFlexContainer.frame.size
    }
    
    // MARK: - Private Helpers
    private func setup() {
        viewModel.fetchDetailAboutCritter(type: critterType, id: critterId)
        viewModel.output = self
        addSubview(scrollView)
        scrollView.addSubview(rootFlexContainer)
        critterImage.backgroundColor = Colour.AnimalCrossingPrimary100
        backgroundColor = Colour.AnimalCrossingPrimary100
        rootFlexContainer.backgroundColor = .systemBackground
        rootFlexContainer.layer.cornerRadius = 8
        critterImage.contentMode = .scaleAspectFit
        critterImage.layer.borderWidth = 2
        critterImage.layer.borderColor = UIColor.black.cgColor
        critterImage.layer.cornerRadius = imageSize / 2
        critterNameLabel.numberOfLines = 0
        critterNameLabel.font = UIFont.boldSystemFont(ofSize: 24)
    }
    
    private func addChildViews() {
        rootFlexContainer.flex.define { flex in
            flex.addItem().direction(.column).alignItems(.center).define { flex in
                flex.addItem().direction(.row).marginTop(10).marginBottom(10).define { flex in
                    flex.addItem(critterImage).width(imageSize).height(imageSize)
                }
                flex.addItem().direction(.row).marginBottom(10).define { flex in
                    flex.addItem(critterNameLabel)
                }
            }
        }
    }
    
    private func populate(model: CritterResponseModel) {
        critterImage.sd_setImage(with: URL(string: (model.iconURI!)), placeholderImage: nil)
        critterNameLabel.text = model.name.nameEUen
    }
}

extension ACCritterDetailView: ACCritterDetailViewModelOutput {
    func contentRecieved(model: CritterResponseModel) {
        Dispatch.onMainQueue {
            self.populate(model: model)
        }
    }
    
    func requestFailed(error: String) {
        print(error)
       // alert view future development
    }
}
