//
//  PropertyListView.swift
//  AvatarStream
//
//  Created by Spotlight Deveaux on 2021-11-26.
//

import SwiftUI

struct PropertyListView: View {
    @Environment(\.dismiss) var dismiss
    @EnvironmentObject var memojis: AvatarObservable
    @State var text = ""

    var body: some View {
        NavigationView {
            VStack {
                TextField(
                    "Paste Property List Here",
                    text: $text
                )
            }
            #if !os(macOS)
            .navigationBarTitle("Property List", displayMode: .inline)
            .navigationBarItems(trailing: Button(action: {
                memojis.avatars = importer(givenPlist: text)
                dismiss()
            }) {
                Text("Done").bold()
            })
            #else
                // TODO: DETERMINE BETTER BUTTON
            #endif
        }
    }
}

struct PropertyListView_Previews: PreviewProvider {
    static var previews: some View {
        PropertyListView()
    }
}
