//
//  TTHomeViewController.swift
//  Swift5Demo
//
//  Created by jinbang.li on 2022/7/4.
//  Copyright © 2022 com.test.www. All rights reserved.
//

import UIKit
import SnapKit
class TTHomeViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        view.backgroundColor = UIColor.yellow
        let btn = UIButton(type: .custom)
        btn.backgroundColor = UIColor.red
        btn.addTarget(self, action: #selector(click), for: UIControl.Event.touchUpInside)
        view.addSubview(btn)
        //        btn.frame = CGRect(x: 0, y: 0, width: 100, height: 30)
        //        btn.center = self.view.center
        //测试自动布局代码块
        btn.snp_makeConstraints { make in
            make.width.height.equalTo(120)
            make.center.equalToSuperview().offset(0)
        }
        
    }
    @objc func click(){
        let vc = ViewController()
        navigationController?.pushViewController(vc, animated: false)
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

