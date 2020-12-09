//
//  Coordinator.swift
//  ZapisOnboarding
//
//  Created by ablai erzhanov on 12/9/20.
//  Copyright © 2020 ablai erzhanov. All rights reserved.
//

import Foundation
import UIKit
import SwiftUI

class Coordinator: NSObject,UIPageViewControllerDataSource, UIPageViewControllerDelegate{
     
    
    
    var parent: PageViewController
    
    init(_ pageViewController: PageViewController){
        self.parent = pageViewController
    }
    
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerBefore viewController: UIViewController) -> UIViewController? {
        
        guard let index = parent.viewControllers.firstIndex(of: viewController) else{
            return nil
        }
        
        if index == 0 {
            return parent.viewControllers.last
        }
        
        return parent.viewControllers[index - 1]
    }
    
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerAfter viewController: UIViewController) -> UIViewController? {
        
        guard let index = parent.viewControllers.firstIndex(of: viewController) else{
            return nil
        }
        
        if index + 1 == parent.viewControllers.count{
            return parent.viewControllers.first
        }
        
        return parent.viewControllers[index + 1]
    }
    
    func pageViewController(_ pageViewController: UIPageViewController, didFinishAnimating finished: Bool, previousViewControllers: [UIViewController], transitionCompleted completed: Bool) {
        if completed,
            let visibleViewController = pageViewController.viewControllers?.first,
            let index = parent.viewControllers.firstIndex(of: visibleViewController)
        {
            parent.currentPageIndex = index
        }
    }
    
}
