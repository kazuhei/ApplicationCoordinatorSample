//
//  MainViewController.swift
//  ApplicationCordinator
//
//  Created by 荒井　和平 on 2016/04/11.
//  Copyright © 2016年 荒井　和平. All rights reserved.
//

import UIKit

class MainViewController: UIViewController {
    
    weak var transitionDelegate: TransitionDelegate?

    @IBAction func pushButton(sender: AnyObject) {
        transitionDelegate?.square("yellow", color: UIColor.yellowColor())
    }
    
    @IBAction func presentButton(sender: AnyObject) {
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

