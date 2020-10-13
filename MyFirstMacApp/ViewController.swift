//
//  ViewController.swift
//  MyFirstMacApp
//
//  Created by Hiroyuki Miura on 2020/10/13.
//

import Cocoa

class ViewController: NSViewController {

    lazy var window: NSWindow = self.view.window!

    var mouseLocation: NSPoint { NSEvent.mouseLocation }
    var location: NSPoint { window.mouseLocationOutsideOfEventStream }

    override func viewDidLoad() {
        super.viewDidLoad()
        NSEvent.addLocalMonitorForEvents(matching: [.mouseMoved]) {
            print("mouseLocation:", String(format: "%.1f, %.1f", self.mouseLocation.x, self.mouseLocation.y))
            print("windowLocation:", String(format: "%.1f, %.1f", self.location.x, self.location.y))
            return $0
        }
        NSEvent.addGlobalMonitorForEvents(matching: [.mouseMoved]) { _ in
            print(String(format: "%.0f, %.0f", self.mouseLocation.x, self.mouseLocation.y))
        }
    }
    override func viewWillAppear() {
        super.viewWillAppear()
        window.acceptsMouseMovedEvents = true
    }
}
