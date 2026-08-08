//
//  UINavigationBar+Extensions.swift
//  YPImagePicker
//
//  Created by Sebastiaan Seegers on 02/03/2020.
//  Copyright © 2020 Yummypets. All rights reserved.
//

import UIKit
import Foundation

extension UINavigationBar {
    func setTitleFont(font: UIFont?) {
        guard let font = font  else { return }
        self.titleTextAttributes = [NSAttributedString.Key.font: font]
    }

    func configureNavigationBar(
        isTranslucent: Bool,
        backgroundColor: UIColor,
        tintColor: UIColor,
        titleColor: UIColor,
        titleFont: UIFont? = nil
    ) {
        self.tintColor = tintColor

        let appearance = UINavigationBarAppearance()
        if isTranslucent {
            appearance.configureWithTransparentBackground()
        } else {
            appearance.configureWithOpaqueBackground()
            appearance.backgroundColor = backgroundColor
        }

        var titleAttributes: [NSAttributedString.Key: Any] = [.foregroundColor: titleColor]
        if let titleFont = titleFont {
            titleAttributes[.font] = titleFont
        }
        appearance.titleTextAttributes = titleAttributes

        self.isTranslucent = isTranslucent
        standardAppearance = appearance
        scrollEdgeAppearance = appearance
        compactAppearance = appearance
        compactScrollEdgeAppearance = appearance
    }
}
