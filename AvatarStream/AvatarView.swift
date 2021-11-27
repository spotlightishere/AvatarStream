//
//  AvatarView.swift
//  AvatarStream
//
//  Created by Spotlight Deveaux on 2021-11-26.
//

import SceneKit
import SwiftUI

struct AvatarView: UIViewRepresentable {
    let avatar: AVTAvatar

    init(animoji: String) {
        avatar = AVTAnimoji(named: animoji)
    }

    init(record: AVTAvatarRecord) {
        avatar = AVTAvatarRecordRendering.avatar(for: record, usageIntent: 1)
    }

    func makeUIView(context _: Context) -> UIView {
        let avatarView = AVTView()
        avatarView.avatar = avatar
        avatarView.setEnableFaceTracking(true)
        avatarView.backgroundColor = .green

        return avatarView
    }

    func updateUIView(_: UIView, context _: Context) {}
}

struct AvatarView_Previews: PreviewProvider {
    static var previews: some View {
        AvatarView(animoji: "fox")
    }
}
