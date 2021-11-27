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
            .navigationBarTitle("Property List", displayMode: .inline)
            .navigationBarItems(trailing: Button(action: {
                memojis.avatars = importer(givenPlist: text)
                dismiss()
            }) {
                Text("Done").bold()
            })
        }
    }
}

struct PropertyListView_Previews: PreviewProvider {
    static var previews: some View {
        PropertyListView()
    }
}
