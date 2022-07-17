//
//  TestClass.swift
//  Swift5Demo
//
//  Created by jinbang.li on 2022/7/13.
//  Copyright © 2022 com.test.www. All rights reserved.
//

import Foundation
/*
 @objcMembers 有较多属性或方法都需要加上@objc的话，会多比较多的代码，使用@objcMembers可减少代码
 关闭@objc,可以用@noobjc进行修饰
 **/
@objcMembers
class TestClass: NSObject {
    var name = ""
     var age = 10
    @objc func action() {
        print(#function)
    }
}
