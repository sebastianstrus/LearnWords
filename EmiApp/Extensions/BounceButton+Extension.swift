//
//  BounceButton+Extension.swift
//  EmiApp
//
//  Created by Sebastian Strus on 2019-04-07.
//  Copyright © 2019 Sebastian Strus. All rights reserved.
//

import UIKit

extension BounceButton {
    
    public convenience init(title: String) {
        self.init()
        
        
        let attributedString = NSMutableAttributedString(attributedString: NSAttributedString(string: title, attributes: [NSAttributedString.Key.font: AppFonts.BUTTONS_FONT!, .foregroundColor: UIColor.white]))
        self.setAttributedTitle(attributedString, for: .normal)
        self.layer.cornerRadius = Device.IS_IPHONE ? 20 : 40
        self.layer.borderColor = UIColor.white.cgColor
        self.layer.borderWidth = 1
        self.backgroundColor = AppColors.TRANSPARENT_BLACK
        self.setAnchor(width: Device.IS_IPHONE ? 240 : 480,
                         height: Device.IS_IPHONE ? 40 : 80)
        
    }
    
    
    
}
