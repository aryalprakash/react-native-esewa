//
//  RNEsewa.swift
//  RNEsewa
//
//  Created by Dipendra Shrestha on 8/12/20.
//  Copyright © 2020 Facebook. All rights reserved.
//

import Foundation
import UIKit

@objc(RNEsewa)
class RNEsewa: NSObject {
  
  @objc
  func makePayment() -> Void {
    DispatchQueue.main.async {
      let modelVC: UIViewController;
      modelVC = RNEsewaViewController()
      let navController = UINavigationController(rootViewController: modelVC)
      navController.modalPresentationStyle = .fullScreen
      let topController = UIApplication.topMostViewController()
      topController?.present(navController, animated: false, completion: nil)
    }
  }

  @objc
  static func requiresMainQueueSetup() -> Bool {
    return true
  }
}

