//
//  Extensions.swift
//  Messenger
//
//  Created by Roger Yuen on 2021/1/5.
//

import Foundation
import UIKit

extension UIView {
    var width: CGFloat {
        self.frame.size.width
    }
    
    var height: CGFloat {
        self.frame.size.height
    }
    
    var top: CGFloat {
        self.frame.origin.y
    }
    
    var bottom: CGFloat {
        self.frame.size.height + self.frame.origin.y
    }
    
    var left: CGFloat {
        self.frame.origin.x
    }
    
    var right: CGFloat {
        self.frame.size.width + self.frame.origin.x
    }
}
