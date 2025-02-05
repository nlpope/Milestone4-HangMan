//
//  ViewController+Ext.swift
//  Milestone4-HangMan
//
//  Created by Noah Pope on 2/5/25.
//

import UIKit

extension UIViewController
{
    func addSubviewz(_ views: UIView...) { for view in views { view.addSubview(view) } }
}
