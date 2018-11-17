//
//  ViewController.swift
//  feigenbaum
//
//  Created by Eric O'Connell on 9/22/18.
//  Copyright © 2018 Eric O'Connell. All rights reserved.
//

import Cocoa

class ViewController: NSViewController {

    @IBOutlet var imageView: NSImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        let feigenbaum = Feigenbaum()
        imageView.image = NSImage(cgImage: feigenbaum.cgImage, size: feigenbaum.size)
        
        // Do any additional setup after loading the view.
    }

    override var representedObject: Any? {
        didSet {
        // Update the view, if already loaded.
        }
    }


}

