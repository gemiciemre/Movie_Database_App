//
//  EnvironmentValues+vibrancyEffectStyle.swift
//  Movie Database
//
//  Created by Emre Gemici on 10.12.2023.
//

import SwiftUI

extension EnvironmentValues {
    var vibrancyEffectStyle: UIVibrancyEffectStyle? {
        get {
            self[VibrancyEffectStyleKey.self]
        }
        set {
            self[VibrancyEffectStyleKey.self] = newValue
        }
    }
}
