//
//  WeatherCell.swift
//  Weather
//
//  Created by Canh Tran Wizeline on 6/11/20.
//  Copyright © 2020 CanhTran. All rights reserved.
//

import UIKit

final class WeatherCell: UITableViewCell {
    
    // MARK: UI Properties
    
    private let dateTimeLabel: UILabel = {
        let label = createBaseLabel()
        return label
    }()
    
    private let averageTempLabel: UILabel = {
        let label = createBaseLabel()
        return label
    }()
    
    private let pressureLabel: UILabel = {
        let label = createBaseLabel()
        return label
    }()
    
    private let humidityLabel: UILabel = {
        let label = createBaseLabel()
        return label
    }()
    
    private let descriptionLabel: UILabel = {
        let label = createBaseLabel()
        return label
    }()
    
    private let separateView: UIView = {
        let view = UIView()
        view.backgroundColor = UIColor.white.withAlphaComponent(0.8)
        return view
    }()
    
    private static func createBaseLabel() -> UILabel {
        let label = UILabel()
        label.font = NABFont.title
        label.textColor = AppColor.white
        label.textAlignment = .left
        return label
    }
    
    // MARK: - Public functions
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupViews()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupViews() {
        backgroundColor = AppColor.darkBackground
        
        contentView.addSubview(dateTimeLabel)
        dateTimeLabel.anchor(top: contentView.topAnchor,
                             left: contentView.leftAnchor,
                             right: contentView.rightAnchor,
                             paddingTop: Constraints.paddingX2,
                             paddingLeft: Constraints.paddingX2,
                             paddingRight: Constraints.paddingX2)
        
        contentView.addSubview(averageTempLabel)
        averageTempLabel.anchor(top: dateTimeLabel.bottomAnchor,
                                left: dateTimeLabel.leftAnchor,
                                right: dateTimeLabel.rightAnchor,
                                paddingTop: Constraints.paddingX2)
        
        contentView.addSubview(pressureLabel)
        pressureLabel.anchor(top: averageTempLabel.bottomAnchor,
                             left: averageTempLabel.leftAnchor,
                             right: averageTempLabel.rightAnchor,
                             paddingTop: Constraints.paddingX2)
        
        contentView.addSubview(humidityLabel)
        humidityLabel.anchor(top: pressureLabel.bottomAnchor,
                             left: pressureLabel.leftAnchor,
                             right: pressureLabel.rightAnchor,
                             paddingTop: Constraints.paddingX2)
        
        contentView.addSubview(descriptionLabel)
        descriptionLabel.anchor(top: humidityLabel.bottomAnchor,
                                left: humidityLabel.leftAnchor,
                                right: humidityLabel.rightAnchor,
                                paddingTop: Constraints.paddingX2)
        
        contentView.addSubview(separateView)
        separateView.anchor(top: descriptionLabel.bottomAnchor,
                            left: descriptionLabel.leftAnchor,
                            right: contentView.rightAnchor,
                            paddingTop: Constraints.paddingX2,
                            height: Constraints.lineHeight)
        separateView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -Constraints.basePadding)
            .set(priority: .defaultHigh)
            .set(active: true)
    }
    
    func configCell(with forecast: Forecast) {
        let weatherViewModel = WeatherCellViewModel(forecast: forecast)
        
        dateTimeLabel.text = weatherViewModel.dateTime
        averageTempLabel.text = weatherViewModel.avgTemp
        pressureLabel.text = weatherViewModel.pressure
        humidityLabel.text = weatherViewModel.humidity
        descriptionLabel.text = weatherViewModel.description
    }
}
