//
//  TTNavigationControllerViewController.swift
//  Swift5Demo
//
//  Created by jinbang.li on 2022/7/4.
//  Copyright © 2022 com.test.www. All rights reserved.
//

import UIKit

class TTNavigationControllerViewController: UINavigationController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
//        self.navigationController?.navigationBar.tintColor = UIColor.red
        
        let tab  = UITabBarController()
        kTabbarHeight = tab.tabBar.frame.size.height
        

    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
extension TTNavigationControllerViewController{
    override func pushViewController(_ viewController: UIViewController, animated: Bool) {
        if children.count > 0 {
            viewController.hidesBottomBarWhenPushed = true
        }
        super.pushViewController(viewController, animated: animated)
    }
}
