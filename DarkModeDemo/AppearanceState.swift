//
//  AppearanceState.swift
//  DarkModeTest
//
//  Created by Doug Diego on 8/11/19.
//  Copyright © 2019 Doug Diego. All rights reserved.
//

import Foundation

enum AppearanceState: Int {
    case system = 0, light, dark

    static let count: Int = {
          var max: Int = 0
          while AppearanceState(rawValue: max) != nil { max += 1 }
          return max
      }()

    func name() -> String {
        switch self {
        case .system:
            return "System"
        case .light:
            return "Light"
        case .dark:
            return "Dark"
        }
    }
}
