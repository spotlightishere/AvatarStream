//
//  MemojiThumbnailer.swift
//  AvatarStream
//
//  Created by Spotlight Deveaux on 2021-11-24.
//

import Foundation

class MemojiThumbnailer: NSObject {
    static let shared = MemojiThumbnailer()
    let options = AVTStickerGeneratorOptions.default()

    private var rendered: CommonImage?

    func renderPuppet(record: AVTAvatarRecord) -> AVTAvatar {
        // TODO: What does 1 signify?
        AVTAvatarRecordRendering.avatar(for: record, usageIntent: 1)
    }

    func thumbnailPuppet(record: AVTAvatarRecord) -> CommonImage {
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

    // Unfortunately, we cannot query the system Memoji datastore due to sandboxing.
    // (This would require com.apple.security.temporary-exception.mach-lookup.global-name,
    // which is forbidden within the iOS sandbox.)
    // macOS is okay with it, however!
    #if os(macOS)
        let dataSource = AVTPAvatarRecordDataSource.defaultUIDataSource(withDomainIdentifier: Bundle.main.bundleIdentifier!)
    #endif

    func getMemoji() -> AvatarRecords {
        var records: [AvatarRecord] = []

        #if os(macOS)
            for index in 0 ..< dataSource.numberOfRecords() {
                let record = dataSource.record(at: index)
                // We only want Memoji.
                if record.isPuppet() {
                    continue
                }

                records += [AvatarRecord(name: "Memoji", record: record)]
            }
        #else
            // TODO: MEMOJI
        #endif

        let returnVal = AvatarRecords()
        returnVal.avatars = records
        return returnVal
    }
}

extension AvatarRecord {
    func avatar() -> AVTAvatar {
        if record.isPuppet() {
            // The system can provide an avatar better than we can.
            return AVTAnimoji(named: name)
        } else {
            return MemojiThumbnailer.shared.renderPuppet(record: record)
        }
    }

    func thumbnail() -> CommonImage {
        if record.isPuppet() {
            // The system has just the perfect thumbnail for these!
            return AVTAnimoji.thumbnail(forAnimojiNamed: name, options: nil)
        } else {
            return MemojiThumbnailer.shared.thumbnailPuppet(record: record)
        }
    }
}
