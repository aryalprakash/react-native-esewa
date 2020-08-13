//
//  RNEsewaViewController.swift
//  RNEsewa
//
//  Created by Dipendra Shrestha on 8/12/20.
//  Copyright © 2020 Facebook. All rights reserved.
//

import Foundation
import UIKit
import EsewaSDK
class RNEsewaViewController: UIViewController, EsewaSDKPaymentDelegate {


  func onEsewaSDKPaymentSuccess(info: [String : Any]) {
    self.dismiss(animated: true, completion: nil)
  }
  
  func onEsewaSDKPaymentError(errorDescription: String) {
    self.dismiss(animated: true, completion: nil)
  }

  var sdk: EsewaSDK?

  override func viewDidLoad() {
    let backButton = UIButton()
    let label = UILabel(frame: CGRect(x: 10, y: (view.frame.size.height / 2 - 100), width: view.frame.size.width, height: 100))
    sdk = EsewaSDK(inViewController: self, environment: .development, delegate: self)
    initiatePayment()
    view.backgroundColor = UIColor(red: 65/255.0, green: 161/255.0, blue: 37/255.0, alpha: 1.0)
    label.text = "You have cancelled payment. Please press 'OK' to go back."
    label.numberOfLines = 5
    label.textColor = .white
    view.addSubview(label)
    view.addSubview(backButton)
    backButton.translatesAutoresizingMaskIntoConstraints = false
    backButton.backgroundColor = UIColor(red: 65/255.0, green: 161/255.0, blue: 37/255.0, alpha: 1.0)
//    backButton.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
//    backButton.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
//    backButton.heightAnchor.constraint(equalToConstant: 60).isActive = true
//    backButton.widthAnchor.constraint(equalToConstant: 180).isActive = true
    backButton.setTitle("OK", for: .normal)
    backButton.addTarget(self, action: #selector(onBackButtonClicked), for: .touchUpInside)
  }

  @objc func onBackButtonClicked() {
    self.dismiss(animated: true, completion: nil)
  }

  func initiatePayment() {
    //Start payment process
    sdk?.initiatePayment(merchantId: "MERCHANT_ID", merchantSecret: "MERCHANT_SECRET", productName: "PRODUCT_NAME", productAmount: "PRICE", productId: "PRODUCT_ID", callbackUrl: "https://callbackurl.com")
  }

}

