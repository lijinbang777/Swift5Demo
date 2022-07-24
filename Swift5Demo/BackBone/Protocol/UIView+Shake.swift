//
//  Button+Shake.swift
//  Swift5Demo
//
//  Created by jinbang.li on 2022/7/24.
//  Copyright © 2022 com.test.www. All rights reserved.
//

import Foundation
import UIKit
//抖动方向枚举
public enum LL_ShakeDirection: Int {
    case horizontal  //水平抖动
    case vertical  //垂直抖动
}
 //后续可拆成面向协议编程模块
extension UIView {
    public func shake(direction: LL_ShakeDirection = .horizontal, times: Int = 5,
                      interval: TimeInterval = 0.1, delta: CGFloat = 2,
                      completion: (() -> Void)? = nil) {
        UIView.animate(withDuration: interval, animations: { () -> Void in
            switch direction {
            case .horizontal:
                self.layer.setAffineTransform( CGAffineTransform(translationX: delta, y: 0))
                break
            case .vertical:
                self.layer.setAffineTransform( CGAffineTransform(translationX: 0, y: delta))
                break
            }
        }) { (complete) -> Void in
            //如果当前是最后一次抖动，则将位置还原，并调用完成回调函数
            if (times == 0) {
                UIView.animate(withDuration: interval, animations: { () -> Void in
                    self.layer.setAffineTransform(CGAffineTransform.identity)
                }, completion: { (complete) -> Void in
                    completion?()
                })
            }
            else {
                self.shake(direction: direction, times: times - 1,  interval: interval,
                           delta: delta * -1, completion:completion)
            }
        }
    }
}
