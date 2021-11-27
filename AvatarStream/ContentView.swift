//
//  ContentView.swift
//  AvatarStream
//
//  Created by Spotlight Deveaux on 2021-11-26.
//

import SwiftUI

class AvatarObservable: ObservableObject {
    @Published var avatars: [AvatarRecord] = []
}

struct ContentView: View {
    let thumbnailer = MemojiThumbnailer()
    @State var showingPlist = false
    @StateObject var memojis = AvatarObservable()

    var body: some View {
        NavigationView {
            List {
                ForEach(AVTAnimoji.animojiNames(), id: \.self) { name in
                    NavigationLink(destination: AvatarView(animoji: name)) {
                        Image(uiImage: AVTAnimoji.thumbnail(forAnimojiNamed: name, options: nil))
                            .resizable()
                            .frame(width: 75.0, height: 75.0)
                            .scaledToFit()
                            .padding()
                        Text(name.capitalized)
                            .font(.title3)
                    }
                }

                ForEach(memojis.avatars, id: \.self) { memoji in
                    NavigationLink(destination: AvatarView(record: memoji.record)) {
                        Image(uiImage: thumbnailer.thumbnailPuppet(record: memoji.record))
                            .resizable()
                            .frame(width: 75.0, height: 75.0)
                            .scaledToFit()
                            .padding()
                        Text(memoji.name.capitalized)
                            .font(.title3)
                    }
                }
            }.navigationTitle("Animoji")
                .toolbar {
                    ToolbarItem(placement: .primaryAction) {
                        Menu {
                            Button(action: {
                                showingPlist.toggle()
                            }) {
                                Label("Import from Property List", systemImage: "square.and.arrow.down")
                            }
                        } label: {
                            Label("Share", systemImage: "square.and.arrow.up")
                        }
                    }
                }
        }.sheet(isPresented: $showingPlist) {
            PropertyListView()
                .environmentObject(memojis)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
