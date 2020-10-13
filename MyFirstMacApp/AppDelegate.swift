//
//  AppDelegate.swift
//  MyFirstMacApp
//
//  Created by Hiroyuki Miura on 2020/10/13.
//

import Cocoa
import SwiftUI
import Carbon

let keyboard = TISCopyCurrentKeyboardInputSource().takeRetainedValue()
let keyboardString = String(describing: keyboard)

//let range = keyboardString.range(of: "inputmethod.", options: .literal, range: keyboardString.startIndex..<keyboardString.endIndex)!
//let startingKeyboard = range.upperBound
//let theKeyboardLayout = keyboardString[startingKeyboard ..< keyboardString.endIndex]

var wd = NSWindow()
var vc = ViewController()

@NSApplicationMain
class AppDelegate: NSObject, NSApplicationDelegate {

    var window: NSWindow!

    func applicationDidFinishLaunching(_ aNotification: Notification) {
        // Create the SwiftUI view that provides the window contents.
        print("theKeyboardLayout ", keyboardString)

        Timer.scheduledTimer(timeInterval: 1/60, target: self, selector: #selector(self.timerUpdate), userInfo: nil, repeats: true)

        let contentView = ContentView()

        // Create the window and set the content view.
        wd = NSWindow(
            contentRect: NSRect(x: 0, y: 0, width: 100, height: 40),
            styleMask: [],
            backing: .buffered, defer: false)
        wd.isReleasedWhenClosed = false
        wd.center()
        wd.setFrameAutosaveName("Main Window")
        wd.contentView = NSHostingView(rootView: contentView)
        wd.makeKeyAndOrderFront(nil)
    }

    func applicationWillTerminate(_ aNotification: Notification) {
        // Insert code here to tear down your application
    }
    
    @objc func timerUpdate() {
        let x = vc.mouseLocation.x
        let y = vc.mouseLocation.y
        wd.setFrameTopLeftPoint(NSPoint(x: x, y: y))
    }

}

