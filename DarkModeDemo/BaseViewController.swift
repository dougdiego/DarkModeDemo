//
//  BaseViewController.swift
//  DarkModeTest
//
//  Created by Doug Diego on 8/11/19.
//  Copyright © 2019 Doug Diego. All rights reserved.
//

import UIKit

class BaseViewController: UIViewController {

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        updateColorAppearance()
    }

    override func traitCollectionDidChange(_ previousTraitCollection: UITraitCollection?) {
        super.traitCollectionDidChange(previousTraitCollection)

        if let previousTraitCollection = previousTraitCollection,
            previousTraitCollection.hasDifferentColorAppearance(comparedTo: traitCollection) {
            updateColorAppearance()
        }
    }

    func updateColorAppearance(){
        if let state = AppearanceState(rawValue: UserDefaultsConfig.appearanceState) {
            switch state {
            case .dark:
                overrideUserInterfaceStyle = .dark
                self.navigationController?.overrideUserInterfaceStyle = .dark
            case .light:
                overrideUserInterfaceStyle = .light
                self.navigationController?.overrideUserInterfaceStyle = .light
            case .system:
                overrideUserInterfaceStyle = .unspecified
                self.navigationController?.overrideUserInterfaceStyle = .unspecified
            }
        }
    }
}
