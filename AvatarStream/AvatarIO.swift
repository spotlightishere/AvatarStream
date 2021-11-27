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
}

class AvatarRecords: Codable {
    var avatars: [AvatarRecord] = []
}

// It would be nice to permit export at some point in time.
// TODO: export
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
