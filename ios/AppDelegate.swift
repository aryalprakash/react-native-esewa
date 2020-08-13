//
//  AppDelegate.swift
//  RNEsewa
//
//  Created by Dipendra Shrestha on 8/12/20.
//  Copyright © 2020 Facebook. All rights reserved.
//

import Foundation
import UIKit
extension UIApplication {
  class func topMostViewController(controller: UIViewController? = UIApplication.shared.keyWindow?.rootViewController) -> UIViewController? {
    if let navigationController = controller as? UINavigationController {
      return topMostViewController(controller: navigationController.visibleViewController)
    }
    if let tabController = controller as? UITabBarController {
      if let selected = tabController.selectedViewController {
        return topMostViewController(controller: selected)
      }
    }
    if let presented = controller?.presentedViewController {
      return topMostViewController(controller: presented)
    }
    return controller
  }
}
