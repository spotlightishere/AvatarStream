//
//  PlatformAvatarView.swift
//  AvatarStream (macOS)
//
//  Created by Spotlight Deveaux on 2021-11-26.
//

import SceneKit
import SwiftUI

struct PlatformAvatarView: NSViewRepresentable {
    let avatar: AVTAvatar

    func makeNSView(context _: Context) -> NSView {
        let avatarView = AVTView()
        avatarView.avatar = avatar

        return avatarView
    }

    func updateNSView(_: NSView, context _: Context) {}
}

struct PlatformAvatarView_Previews: PreviewProvider {
    static var previews: some View {
        PlatformAvatarView(avatar: AVTAnimoji(named: "fox"))
    }
}
