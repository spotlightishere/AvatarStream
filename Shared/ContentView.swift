//
//  ContentView.swift
//  AvatarStream
//
//  Created by Spotlight Deveaux on 2021-11-26.
//

import MultipeerKit
import SwiftUI

class AvatarObservable: ObservableObject {
    @Published var avatars: [AvatarRecord] = []
}

struct ContentView: View {
    let thumbnailer = MemojiThumbnailer()
    @State var showingPlist = false
    @StateObject var memojis = AvatarObservable()
    @ObservedObject var datasource: MultipeerDataSource = {
        var config = MultipeerConfiguration.default
        config.serviceType = "avatar"
        config.security.encryptionPreference = .required

        let transceiver = MultipeerTransceiver(configuration: config)
        return MultipeerDataSource(transceiver: transceiver)
    }()

    var body: some View {
        NavigationView {
            List {
                // Registered Memoji
                ForEach(thumbnailer.getMemoji().avatars, id: \.self) { memoji in
                    NavigationLink(destination: AvatarView(avatar: memoji.avatar())) {
                        LinkView(image: memoji.thumbnail(), name: memoji.name)
                    }
                }

                // Normal Animoji
                ForEach(AVTAnimoji.animojiNames(), id: \.self) { name in
                    NavigationLink(destination: AvatarView(animoji: name)) {
                        LinkView(image: AVTAnimoji.thumbnail(forAnimojiNamed: name, options: nil), name: name)
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
                            Button(action: {
                                exporter()
                            }) {
                                Label("Share Memoji to Clipboard", systemImage: "square.and.arrow.up")
                            }
                            Button(action: {
                                let all = thumbnailer.getMemoji()
                                datasource.transceiver.send(all, to: datasource.transceiver.availablePeers)
                            }) {
                                Label("Share Memoji to Local Devices", systemImage: "square.and.arrow.up")
                            }.disabled(datasource.availablePeers.isEmpty)
                        } label: {
                            Label("Share", systemImage: "square.and.arrow.up")
                        }
                    }
                }
        }.sheet(isPresented: $showingPlist) {
            PropertyListView()
                .environmentObject(memojis)
        }.onAppear {
            datasource.transceiver.resume()
            datasource.transceiver.receive(AvatarRecords.self) { payload, _ in
                memojis.avatars = payload.avatars
            }
        }
    }
}

struct LinkView: View {
    let image: CommonImage
    let name: String

    var body: some View {
        Image(image: image)
            .resizable()
            .frame(width: 75.0, height: 75.0)
            .scaledToFit()
            .padding()
        Text(name.capitalized)
            .font(.title3)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
