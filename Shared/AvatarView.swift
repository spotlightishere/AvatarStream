//
//  AvatarStreamApp.swift
//  Shared
//
//  Created by Spotlight Deveaux on 2021-11-26.
//

import SwiftUI

struct AvatarView: View {
    let avatar: AVTAvatar

    init(avatar: AVTAvatar) {
        self.avatar = avatar
    }

    init(animoji: String) {
        avatar = AVTAnimoji(named: animoji)
    }

    var body: some View {
        PlatformAvatarView(avatar: avatar)
    }
}

struct AvatarView_Previews: PreviewProvider {
    static var previews: some View {
        AvatarView(animoji: "fox")
    }
}
