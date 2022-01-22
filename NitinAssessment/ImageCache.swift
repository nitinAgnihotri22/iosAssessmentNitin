//
//  ImageCache.swift
//  NitinAssessment
//
//  Created by Nitin Agnihotri on 22/01/22.
//

import Foundation
class ImageCache {

    private init() {}

    static let shared = NSCache<NSString, UIImage>()
    
    static func removeCache() {
        ImageCache.shared.removeAllObjects()
    }
}
