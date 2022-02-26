//
//  extension.swift
//  stud_CRUD_prac
//
//  Created by DCS on 25/02/22.
//  Copyright © 2022 DCS. All rights reserved.
//

import UIKit

extension UIView {
    var width : CGFloat {return frame.size.width }
    var height : CGFloat {return frame.size.height }
    var top : CGFloat {return frame.origin.y }
    var bottom : CGFloat {return frame.origin.y + frame.size.height }
    var left : CGFloat {return frame.origin.x }
    var right : CGFloat {return frame.origin.x + frame.size.width }
}
