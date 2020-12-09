//
//  PageViewController.swift
//  ZapisOnboarding
//
//  Created by ablai erzhanov on 12/9/20.
//  Copyright © 2020 ablai erzhanov. All rights reserved.
//

import Foundation
import UIKit
import SwiftUI

struct PageViewController: UIViewControllerRepresentable {
    
    @Binding var currentPageIndex: Int
    
    func makeUIViewController(context: Context) -> UIPageViewController {
        let pageViewController = UIPageViewController(
            transitionStyle: .scroll,
            navigationOrientation: .horizontal)
        
        pageViewController.dataSource = context.coordinator
        pageViewController.delegate = context.coordinator
        
        return pageViewController
        
    }
    func updateUIViewController(_ pageViewController: UIPageViewController, context: Context) {
        pageViewController.setViewControllers([viewControllers[currentPageIndex]], direction: .forward, animated: true)
    }
    
    var viewControllers: [UIViewController]
    
    func makeCoordinator() -> Coordinator {
        Coordinator(self)
    }
    
}
