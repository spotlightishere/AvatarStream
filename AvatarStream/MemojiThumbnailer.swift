//
//  MemojiThumbnailer.swift
//  AvatarExport
//
//  Created by Spotlight Deveaux on 2021-11-24.
//

import Foundation
import UIKit

class MemojiThumbnailer: NSObject {
    let options = AVTStickerGeneratorOptions.default()

    var rendered: UIImage?

    func renderPuppet(record: AVTAvatarRecord) -> AVTAvatar {
        // TODO: What does 1 signify?
        AVTAvatarRecordRendering.avatar(for: record, usageIntent: 1)
    }

    func thumbnailPuppet(record: AVTAvatarRecord) -> UIImage {
        let render = renderPuppet(record: record)
        let generator = AVTStickerGenerator(avatar: render)
        // Ensures completionHandler does not immediately return
        generator.setAsync(false)

        let configurations = AVTStickerConfiguration.stickerConfigurationsForMemoji(inStickerPack: kAVTStickerPackPoses)
        let first = configurations.firstObject! as! AVTStickerConfiguration

        generator.stickerImage(with: first, options: options, completionHandler: { rendered, _ in
            self.rendered = rendered
        })
        return rendered!
    }
}
