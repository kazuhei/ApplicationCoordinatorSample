//
//  CircleViewController.swift
//  ApplicationCordinator
//
//  Created by 荒井　和平 on 2016/04/22.
//  Copyright © 2016年 荒井　和平. All rights reserved.
//

import Foundation
import UIKit
public class CircleViewController: UIViewController {
    
    public var color: UIColor?
    public var transitionDelegate: TransitionDelegate?
    
    @IBOutlet weak var circleView: UIView!
    
    @IBAction func pushCircle(sender: AnyObject) {
        transitionDelegate?.circle(UIColor.blueColor())
    }
    
    @IBAction func backHomeAndPushSquare(sender: AnyObject) {
        transitionDelegate?.pushSquareToRoot("pushSquareToRoot", color: UIColor.blackColor())
    }

    @IBAction func backHomeAndPresentLine(sender: AnyObject) {
        transitionDelegate?.presentLineToRoot(UIColor.blackColor())
    }
    
    @IBAction func backPrevAndPushSquare(sender: AnyObject) {
        transitionDelegate?.popAndPushSquare("success", color: UIColor.cyanColor())
    }
    
    public override func viewDidLoad() {
        circleView.layer.cornerRadius = 50
        circleView.backgroundColor = color
        circleView.clipsToBounds = true
    }
    
}
