//
//  AvatarIO.swift
//  AvatarImport
//
//  Created by Spotlight Deveaux on 2021-11-26.
//

import Foundation

struct AvatarRecord: Codable, Hashable {
    var name: String
    var record: AVTAvatarRecord

    enum CodingKeys: String, CodingKey {
        case name
        case record
    }

    func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encode(name, forKey: .name)

        let recordValue = try NSKeyedArchiver.archivedData(withRootObject: record, requiringSecureCoding: true)
        try container.encode(recordValue, forKey: .record)
    }

    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)

        name = try container.decode(String.self, forKey: .name)

        let recordValue = try container.decode(Data.self, forKey: .record)
        record = try NSKeyedUnarchiver.unarchivedObject(ofClass: AVTAvatarRecord.self, from: recordValue)!
    }

    init(name: String, record: AVTAvatarRecord) {
        self.name = name
        self.record = record
    }
}

class AvatarRecords: Codable {
    var avatars: [AvatarRecord] = []
}

func importer(givenPlist: String) -> [AvatarRecord] {
    var returnVal: [AvatarRecord] = []

    do {
        var plist: AvatarRecords

        let decoder = PropertyListDecoder()
        plist = try decoder.decode(AvatarRecords.self, from: givenPlist.data(using: .utf8)!)

        returnVal = plist.avatars
    } catch let e {
        print(e)
    }

    return returnVal
}

func importer(records: AvatarRecords) -> [AvatarRecord] {
    records.avatars
}

func exporter() {
    do {
        let endData = MemojiThumbnailer.shared.getMemoji()

        let encoder = PropertyListEncoder()
        encoder.outputFormat = .xml
        let plist = try encoder.encode(endData)
        let dataString = String(data: plist, encoding: .utf8)!

        #if os(macOS)
            let pasteboard = NSPasteboard.general
            pasteboard.clearContents()
            pasteboard.setString(dataString, forType: .string)
        #else
            UIPasteboard.general.string = dataString
        #endif
    } catch let e {
        print(e)
    }
}
