//
//  SettingsDarkModeViewModel.swift
//  DarkModeTest
//
//  Created by Doug Diego on 8/11/19.
//  Copyright © 2019 Doug Diego. All rights reserved.
//

import Foundation

class SettingsAppearanceViewModel: NSObject {

    func numOfSections() -> Int {
        return 1
    }

    func numOfRows(inSection section: Int) -> Int {
        return AppearanceState.count
    }

    func title(_ indexPath: IndexPath) -> String? {
        return AppearanceState(rawValue: indexPath.row)?.name()
    }

    func isSelected(_ indexPath: IndexPath) -> Bool {
        let state = AppearanceState(rawValue: UserDefaultsConfig.appearanceState)
        if state?.rawValue == indexPath.row {
            return true
        } else {
            return false
        }
    }
}
