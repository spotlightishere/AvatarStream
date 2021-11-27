//
//  PlatformAvatarView.swift
//  AvatarStream (iOS)
//
//  Created by Spotlight Deveaux on 2021-11-26.
//

import SceneKit
import SwiftUI

struct PlatformAvatarView: UIViewRepresentable {
    let avatar: AVTAvatar

    func makeUIView(context _: Context) -> UIView {
        let avatarView = AVTView()
        avatarView.avatar = avatar
        avatarView.setEnableFaceTracking(true)
        avatarView.backgroundColor = .green

        return avatarView
    }

    func updateUIView(_: UIView, context _: Context) {}
}

struct PlatformAvatarView_Previews: PreviewProvider {
    static var previews: some View {
        PlatformAvatarView(avatar: AVTAnimoji(named: "fox"))
    }
}
