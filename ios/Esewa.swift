import Foundation
import EsewaSDK

@objc(Esewa)
class Esewa: NSObject {
  private var count = 0
  @objc
  func increment() {
    count += 1
    print("count is \(count)")
  }
   @objc
  func constantsToExport() -> [AnyHashable : Any]! {
    return ["initialCount": 0]
  }
}