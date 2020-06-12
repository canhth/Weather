//
//  WeatherCell.swift
//  Weather
//
//  Created by Canh Tran Wizeline on 6/11/20.
//  Copyright © 2020 CanhTran. All rights reserved.
//

import UIKit

final class WeatherCell: UITableViewCell {

    private let dateTimeLabel: UILabel = {
        let label = UILabel()
        label.font = NABFont.section
        label.textColor = AppColor.white
        return label
    }()
    
    private let dataAmountLabel: UILabel = {
        let label = UILabel()
        label.font = NABFont.numberValue
        label.textColor = AppColor.white
        label.textAlignment = .right
        return label
    }()

}
