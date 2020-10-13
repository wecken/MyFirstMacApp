//
//  ContentView.swift
//  MyFirstMacApp
//
//  Created by Hiroyuki Miura on 2020/10/13.
//

import SwiftUI
import Cocoa

public var mouseLocation: NSPoint { NSEvent.mouseLocation }

struct ContentView: View {
    var body: some View {
        VStack {
            Text("Hello, World!")
                .frame(maxWidth: .infinity, maxHeight: .infinity)
            Button(action: {
                print(mouseLocation)
            }) {
                Text("Press me")
            }
        }
    }
}


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
