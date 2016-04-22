//
//  SquareViewController.swift
//  ApplicationCordinator
//
//  Created by 荒井　和平 on 2016/04/13.
//  Copyright © 2016年 荒井　和平. All rights reserved.
//

import Foundation
import UIKit

public class SquareViewController: UIViewController {
    
    weak var transitionDelegate: TransitionDelegate?
    
    public var name: String?
    public var color: UIColor?
    
    @IBOutlet weak var label: UILabel!
    @IBOutlet weak var colorView: UIView!
    
    @IBAction func yellowButton(sender: AnyObject) {
        transitionDelegate?.square("yellow", color: UIColor.yellowColor())
    }
    
    @IBAction func blueButton(sender: AnyObject) {
        transitionDelegate?.square("blue", color: UIColor.blueColor())
    }
    
    @IBAction func redButton(sender: AnyObject) {
        transitionDelegate?.square("red", color: UIColor.redColor())
    }
    
    @IBAction func circleButton(sender: AnyObject) {
        transitionDelegate?.circle(UIColor.brownColor())
    }
    
    @IBAction func homeButton(sender: AnyObject) {
        transitionDelegate?.home()
    }
    
    public override func viewDidLoad() {
        label.text = name
        colorView.backgroundColor = color
    }
    
}
