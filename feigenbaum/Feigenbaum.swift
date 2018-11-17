//
//  Feigenbaum.swift
//  feigenbaum
//
//  Created by Eric O'Connell on 9/22/18.
//  Copyright © 2018 Eric O'Connell. All rights reserved.
//

import Cocoa

class Feigenbaum {
    
    let width = 1600
    let height = 400
    let bytesPerPixel = 4
    let colorSpace = CGColorSpaceCreateDeviceRGB()
    let bytesPerRow: Int
    let size: CGSize
    var pixels: [UInt32]
    var data: Data!
    var cgImage: CGImage!
    
    init() {
        size = CGSize(width: width, height: height)
        bytesPerRow = width * bytesPerPixel
        pixels = Array(repeating:0, count: width * height)
        data = pixels.withUnsafeMutableBytes { buffer in
            Data(bytesNoCopy: buffer.baseAddress!, count: width * height * 4, deallocator: .none)
        }

//        data = Data(count: width * height * 4)
        
        for x in 0..<width {
            let a = 4.0 / Double(width) * Double(x)

            var y = 0.5

            for i in 0..<200 {
                y = a * y * (1 - y)

                if (i > 100) {
                    let yi = Int(y * Double(height))
                    let offset = yi * width + x
                    pixels[offset] += 10000
                }
            }
        }

        
        let provider = CGDataProvider(data: data as CFData)!
        cgImage = CGImage(
            width: width,
            height: height,
            bitsPerComponent: 8,
            bitsPerPixel: 32,
            bytesPerRow: bytesPerRow,
            space: colorSpace,
            bitmapInfo: CGBitmapInfo.init(rawValue: CGImageAlphaInfo.first.rawValue),
            provider: provider,
            decode: nil,
            shouldInterpolate: false,
            intent: .defaultIntent)!
    }

}
