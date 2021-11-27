//
//  Glue.swift
//  AvatarStream (macOS)
//
//  Created by Spotlight Deveaux on 2021-11-27.
//

import AppKit
import Foundation
import SwiftUI

// We'd like a somewhat agnostic Image type.
typealias CommonImage = NSImage

extension Image {
    init(image: NSImage) {
        self.init(nsImage: image)
    }
}
