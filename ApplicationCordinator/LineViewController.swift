//
//  LineViewController.swift
//  ApplicationCordinator
//
//  Created by 荒井　和平 on 2016/04/22.
//  Copyright © 2016年 荒井　和平. All rights reserved.
//

import Foundation
import UIKit

public class LineViewController: UIViewController {
    
    public var color: UIColor?
    public var transitionDelegate: TransitionDelegate?
    
    @IBOutlet weak var lineView: UIView!
    
    @IBAction func dismissButton(sender: AnyObject) {
        transitionDelegate?.dismissModal()
    }
    
    public override func viewDidLoad() {
        self.lineView.backgroundColor = color
    }
    
}
