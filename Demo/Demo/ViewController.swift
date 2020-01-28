//
//  ViewController.swift
//  Demo
//
//  Created by MeterWhite on 2020/1/26.
//  Copyright © 2020 Meterwhite. All rights reserved.
//

import RealmSwift
import Cocoa

class ViewController: NSViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        autoreleasepool {
            /// In autoreleasepool scope.
            let writing = RLLWriting()
            writing.auto()
            // object.key = value
        }
        
        realm_writing_pool { writing in
            // writing.objects(<#T##type: Element.Type##Element.Type#>)
            // writing.add(<#T##obj: Object##Object#>)
            // writing.update(<#T##obj: Object##Object#>)
            // writing.delete(<#T##obj: Object##Object#>)
            // writing.add(<#T##obj: Object##Object#>).add(<#T##obj: Object##Object#>)
        }
    }
    
    func funcScope() {
        let writing = RLLWriting()
        writing.auto()
        // object.key = value
    }
}

