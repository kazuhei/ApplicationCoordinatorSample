//
//  ApplicationCordinator.swift
//  ApplicationCordinator
//
//  Created by 荒井　和平 on 2016/04/11.
//  Copyright © 2016年 荒井　和平. All rights reserved.
//

import Foundation
import UIKit

public protocol TransitionDelegate: class {
    
    func start()
    func square(name: String, color: UIColor)
    func circle(color: UIColor?)
    func pushSquareToRoot(name: String, color: UIColor)
    func pushCircleToRoot(color: UIColor?)
    func presentSquareToRoot(name: String, color: UIColor)
    func presentCircleToRoot(color: UIColor?)
    func presentLineToRoot(color: UIColor?)
    func popAndPushSquare(name: String, color: UIColor)
    func dismissModal()
    func home()
}

public class ApplicationCordinator : TransitionDelegate {
    
    private let window: UIWindow
    
    init(window: UIWindow) {
        self.window = window
    }
    
    public func start() {
        let vc = getStoryBoard("Main").instantiateInitialViewController() as! MainViewController
        vc.transitionDelegate = self
        window.rootViewController = UINavigationController(rootViewController: vc)
        window.makeKeyAndVisible()
    }
    
    public func square(name: String, color: UIColor) {
        push(getSquare(name, color: color))
    }
    
    public func circle(color: UIColor?) {
        push(getCircle(color))
    }
    
    public func pushSquareToRoot(name: String, color: UIColor) {
        pushVCToRoot(getSquare(name, color: color))
    }
    
    public func pushCircleToRoot(color: UIColor?) {
        pushVCToRoot(getCircle(color))
    }
    
    public func popAndPushSquare(name: String, color: UIColor) {
        popAndPush(getSquare(name, color: color))
    }
    
    public func presentSquareToRoot(name: String, color: UIColor) {
        presentVCToRoot(getSquare(name, color: color))
    }
    
    public func presentCircleToRoot(color: UIColor?) {
        presentVCToRoot(getCircle(color))
    }
    
    public func presentLineToRoot(color: UIColor?) {
        presentVCToRoot(getLine(color))
    }
    
    public func dismissModal() {
        if let nav = getRootNav() {
            nav.presentedViewController?.dismissViewControllerAnimated(true, completion: nil)
        }
    }
    
    public func home() {
        if let nav = window.rootViewController as? UINavigationController {
            nav.popToRootViewControllerAnimated(true)
        }
    }
    
    private func push(vc: UIViewController) {
        if let nav = getRootNav() {
            nav.pushViewController(vc, animated: true)
        }
    }
    
    private func popAndPush(vc: UIViewController) {
        if let nav = getRootNav() {
            nav.popViewControllerAnimated(true)
            nav.pushViewController(vc, animated: true)
        }
    }
    
    private func pushVCToRoot(vc: UIViewController) {
        if let nav = getRootNav() {
            nav.popToRootViewControllerAnimated(true)
            nav.pushViewController(vc, animated: true)
        }
    }
    
    private func presentVCToRoot(vc: UIViewController) {
        if let nav = getRootNav() {
            let newNav = UINavigationController(rootViewController: vc)
            nav.popToRootViewControllerAnimated(true)
            nav.presentViewController(newNav, animated: true, completion: nil)
        }
    }
    
    private func getRootNav() -> UINavigationController? {
        return window.rootViewController as? UINavigationController
    }
    
    private func getSquare(name: String, color: UIColor) -> SquareViewController {
        let squareViewController = getStoryBoard("Square").instantiateInitialViewController() as! SquareViewController
        squareViewController.name = name
        squareViewController.color = color
        squareViewController.transitionDelegate = self
        return squareViewController
    }
    
    private func getCircle(color: UIColor?) -> CircleViewController {
        let circleViewController = getStoryBoard("Circle").instantiateInitialViewController() as! CircleViewController
        circleViewController.color = color
        circleViewController.transitionDelegate = self
        return circleViewController
    }
    
    private func getLine(color: UIColor?) -> LineViewController {
        let lineViewController = getStoryBoard("Line").instantiateInitialViewController() as! LineViewController
        lineViewController.color = color
        lineViewController.transitionDelegate = self
        return lineViewController
    }
    
    private func getStoryBoard(name: String) -> UIStoryboard {
        return UIStoryboard(name: name, bundle: NSBundle.mainBundle())
    }
}
