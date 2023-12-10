//
//  EnvironmentValues+blurEffectStyle.swift
//  Movie Database
//
//  Created by Emre Gemici on 10.12.2023.
//

import SwiftUI

extension EnvironmentValues {
    var blurEffectStyle: UIBlurEffect.Style {
        get {
            self[BlurEffectStyleKey.self]
        }
        set {
            self[BlurEffectStyleKey.self] = newValue
        }
    }
}
