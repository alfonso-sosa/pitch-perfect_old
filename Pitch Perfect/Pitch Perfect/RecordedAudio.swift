//
//  RecordedAudio.swift
//  Pitch Perfect
//
//  Created by Alfonso Sosa on 26/03/15.
//  Copyright (c) 2015 Alfonso Sosa. All rights reserved.
//

import Foundation

class RecordedAudio : NSObject {
    
    init(title: String!, filePathURL: NSURL!) {
        self.title = title
        self.filePathURL = filePathURL
    }
    
    var filePathURL: NSURL!
    var title: String!
    
}
