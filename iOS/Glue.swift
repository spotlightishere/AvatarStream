//
//  Glue.swift
//  AvatarStream (iOS)
//
//  Created by Spotlight Deveaux on 2021-11-27.
//

import Foundation
import SwiftUI
import UIKit

// We'd like a somewhat agnostic Image type.
typealias CommonImage = UIImage

extension Image {
    init(image: UIImage) {
        self.init(uiImage: image)
    }
}
