//
//  EmptyStateView.swift
//  Weather
//
//  Created by Canh Tran Wizeline on 6/13/20.
//  Copyright © 2020 CanhTran. All rights reserved.
//

import UIKit

enum TableViewState: String {
    case start = "Welcome, please find your city."
    case empty = "Opps, there's no data."
    case error = "Please try with another keyword."
}

final class EmptyStateView: UIView {

    private let messageLabel: UILabel = {
        let label = UILabel()        
        label.numberOfLines = 0
        label.textColor = AppColor.white
        label.textAlignment = .center
        label.font = NABFont.section
        return label
    }()

    override init(frame: CGRect) {
        super.init(frame: frame)
        setupView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupView() {
        isUserInteractionEnabled = false
        
        addSubview(messageLabel)
        messageLabel.anchor(left: leftAnchor,
                            right: rightAnchor,
                            paddingLeft: Constraints.paddingX3,
                            paddingRight: Constraints.paddingX3)
        messageLabel.anchorCenter(horizontal: centerXAnchor, vertical: centerYAnchor)
        messageLabel.text = TableViewState.start.rawValue
    }
    
    func showMessage(state: TableViewState) {
        guard let superView = superview else { return }
        messageLabel.text = state.rawValue
        superView.bringSubviewToFront(messageLabel)
    }

}
