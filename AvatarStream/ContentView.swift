//
//  ContentView.swift
//  AvatarStream
//
//  Created by Spotlight Deveaux on 2021-11-26.
//

import SwiftUI

struct ContentView: View {
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
            }.navigationTitle("Animoji")
        }.navigationTitle("Animoji")
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
