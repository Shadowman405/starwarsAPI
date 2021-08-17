//
//  FadeEnabledBtn.swift
//  starwarsAPI
//
//  Created by Maxim Mitin on 15.08.21.
//

import Foundation
import UIKit

class FadeEnabledBtn: UIButton {
    
    override var isEnabled: Bool{
        didSet {
            if isEnabled {
                UIView.animate(withDuration: 0.2) {
                    self.alpha = 1.0
                }
            } else {
                UIView.animate(withDuration: 0.2) {
                    self.alpha = 0.5
                }
            }
        }
        
    }
}
