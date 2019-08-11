//
//  UserDefaultsConfig.swift
//  DarkModeTest
//
//  Created by Doug Diego on 8/11/19.
//  Copyright © 2019 Doug Diego. All rights reserved.
//

import Foundation

struct UserDefaultsConfig {

    @UserDefault("appearance_state", defaultValue: 0)
    static var appearanceState: Int

}
