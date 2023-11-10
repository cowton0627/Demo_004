//
//  MyLabel.swift
//  Demo_004
//
//  Created by Chun-Li Cheng on 2023/11/3.
//

import UIKit
import ObjectiveC

@IBDesignable
class MyLabel: UILabel {

//    @IBInspectable var localizationKey: String? {
//        didSet {
//            #if TARGET_INTERFACE_BUILDER
//            let bundle = Bundle(for: type(of: self))
//            text = bundle.localizedString(forKey: localizationKey ?? "", value: "", table: nil)
//            #else
//            text = localizationKey?.localized
//            #endif
//        }
//    }

}

private var LocalizedKeyProperty: UInt8 = 0


extension UILabel {
    @IBInspectable var localizedKey: String? {
        get {
            return objc_getAssociatedObject(self, &LocalizedKeyProperty) as? String
        }
        set {
            objc_setAssociatedObject(
                self,
                &LocalizedKeyProperty,
                newValue,
                .OBJC_ASSOCIATION_RETAIN_NONATOMIC
            )
            updateText()
        }
    }
        
    private func updateText() {
        guard let key = localizedKey else { return }
        
        #if TARGET_INTERFACE_BUILDER
        let bundle = Bundle(for: type(of: self))
        text = bundle.localizedString(forKey: key, value: "", table: nil)
        #else
        text = key.localized
        #endif
    }
    
//    @IBInspectable var localizedKey: String? {
//        get {
//            return nil
//            // This property is not meant to be read; it's for Interface Builder use only.
//        }
//        set(key) {
//            text = key.flatMap { NSLocalizedString($0, comment: "") }
//        }
//
////        didSet {
////            #if TARGET_INTERFACE_BUILDER
////            let bundle = Bundle(for: type(of: self))
////            text = bundle.localizedString(
////                forKey: localizedKey ?? "", value: "", table: nil)
////            #else
////            text = localizedKey?.localized
////            #endif
////        }
//    }
}

extension String {
    var localized: String {
        return NSLocalizedString(self, comment: "")
    }
}
