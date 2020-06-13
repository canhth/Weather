//
//  BaseViewController.swift
//  Weather
//
//  Created by Canh Tran Wizeline on 9/18/19.
//

import UIKit

open class BaseViewController: UIViewController {

    // MARK: - Public Properties

    var statusBarStyle: UIStatusBarStyle = .default {
        didSet {
            setNeedsStatusBarAppearanceUpdate()
        }
    }

    // MARK: - Life Cycle

    public init() {
        super.init(nibName: nil, bundle: nil)
        Logger.shared.verbose(tag: .lifeCycle, object: self)
    }
    
    required public init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    deinit {
        Logger.shared.verbose(tag: .lifeCycle, object: self)
    }

    open override var preferredStatusBarStyle: UIStatusBarStyle {
        return statusBarStyle
    }
}
